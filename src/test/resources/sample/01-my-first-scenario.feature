Feature: My First feature!

  In order to better understand how cucumber works
  As a developer
  I want a simple feature, that can be launched easily

  Scenario: A simple Calculator

    Given a scientific calculator
    And I have pressed 37
    And I have pressed +
    And I have pressed 5
    When I press =
    Then I should see 42

  Scenario: Multiplication of two numbers

    Given a scientific calculator
    And I have pressed 37
    And I have pressed *
    And I have pressed 5
    When I press =
    Then I should see 185

  Scenario: Consecutive inputs discard the previous one

    Given a scientific calculator
    And I have pressed 37
    And I have pressed 11
    And I have pressed *
    And I have pressed 5
    When I press =
    Then I should see 55

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
