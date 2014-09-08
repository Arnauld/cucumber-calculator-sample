Feature: A more advanced feature!

  In order to even better understand how cucumber works
  As a developer
  I want a more advanced feature, that illustrate some other gherkin syntax

  Scenario Outline: Valid operators

    Given a scientific calculator
    And I have pressed <left operand>
    And I have pressed <operator>
    And I have pressed <right operand>
    When I press =
    Then I should see <result>

  Examples:
    | left operand | operator | right operand | result |
    | 23           | +        | 19            | 42     |
    | 23           | -        | 18            | 5      |
    | 12           | /        | 3             | 4      |
    | 5            | *        | 9             | 45     |

  Scenario: No division by zero

    Given a scientific calculator
    And I have pressed 12
    And I have pressed /
    When I press 0
    Then I should have an error message indicating "division by zero"

  Scenario Outline: Invalid operators

    Given a scientific calculator
    And I have pressed <left operand>
    When I press <operator>
    Then I should have an error message indicating "<reason>"

  Examples:
    | left operand | operator | reason           |
    | 23           | $        | unknown operator |
    | 23           | a        | unknown operator |
    | 12           | :        | unknown operator |
