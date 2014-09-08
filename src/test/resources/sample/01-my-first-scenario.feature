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
