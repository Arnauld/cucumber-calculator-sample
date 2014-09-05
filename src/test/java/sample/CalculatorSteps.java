package sample;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import static org.assertj.core.api.Assertions.assertThat;

public class CalculatorSteps {

    private Calculator calculator;
    private int result;
    private Exception lastException;

    @Given("^a scientific calculator$")
    public void a_scientific_calculator() throws Throwable {
        calculator = new Calculator();
    }

    @Given("^I have pressed (\\d+)$")
    public void I_have_pressed(int value) throws Throwable {
        calculator.input(value);
    }

    @Given("^I have pressed ([^\\d])$")
    public void I_have_pressed_operator(char c) throws Throwable {
        calculator.operator(c);
    }

    @When("^I press ([^\\d])$")
    public void I_press(char op) throws Throwable {
        switch (op) {
            case '=':
                pressEqual();
                break;
            default:
                attemptOperator(op);
        }
    }

    private void attemptOperator(char op) {
        try {
            calculator.operator(op);
        } catch (Exception e) {
            lastException = e;
        }
    }

    private void pressEqual() {
        result = calculator.result();
    }

    @When("^I press (\\d+)$")
    public void I_press(int value) throws Throwable {
        attemptInput(value);
    }

    private void attemptInput(int value) {
        try {
            calculator.input(value);
        } catch (Exception e) {
            lastException = e;
        }
    }

    @Then("^I should see (\\d+)$")
    public void I_should_see(int expectedResult) throws Throwable {
        assertThat(result).isEqualTo(expectedResult);
    }

    @Then("^I should have an error message indicating \"([^\"]+)\"$")
    public void I_should_have_an_error_message_indicating(String message) throws Throwable {
        assertThat(lastException)
                .isNotNull()
                .hasMessageContaining(message);
    }

}
