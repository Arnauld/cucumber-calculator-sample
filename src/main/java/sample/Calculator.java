package sample;

public class Calculator {

    private Integer lastOperand = null;
    private char pendingOperator;

    public void input(int value) {
        int res;
        switch (pendingOperator) {
            case '+':
                res = lastOperand + value;
                break;
            case '*':
                res = lastOperand * value;
                break;
            case '/':
                if(value == 0)
                    throw new IllegalArgumentException("division by zero");
                res = lastOperand / value;
                break;
            case '-':
                res = lastOperand - value;
                break;
            default:
                res = value;
                break;
        }
        lastOperand = res;
        consumeOperator();
    }

    private void consumeOperator() {
        pendingOperator = ' ';
    }

    public void operator(char c) {
        ensureOperatorIsValid(c);
        pendingOperator = c;
    }

    private void ensureOperatorIsValid(char c) {
        String s = String.valueOf(c);
        if(!"+-*/".contains(s))
            throw new IllegalArgumentException("unknown operator: '" + s + "'");
    }

    public int result() {
        if (lastOperand == null)
            throw new IllegalStateException();
        return lastOperand;
    }

}
