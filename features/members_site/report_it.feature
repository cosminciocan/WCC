Feature: This feature contains scenarios for the Report It functionality

  Scenario: Basic Report It flow - Roads and pavements, without contact details
    Given I access the homepage
    When I navigate to the Report It page
    And I submit a Roads and pavements report
#    Then I should receive a confirmation message

  Scenario: Basic Report It Flow - Advertising and trading
    Given I access the homepage
    When I navigate to the Report It page
    And I submit a Advertising and trading report
#    Then I should receive a confirmation message

  Scenario: Checking the validations messages on the details fields
    Given I access the homepage
    When I navigate to the Report It page
    And I choose to place an Advertising and trading report for A Boards (Sandwich Boards)
    Then I press the next button without entering street
    And The error message "This field cannot be empty" should be displayed
    Then I press the next button without entering additional information
    And The error message "This field cannot be empty" should be displayed
    Then I press the next button without entering the problem description
    And The error message "This field cannot be empty" should be displayed

  Scenario: Checking the validation messages on the contact details fields
    Given I access the homepage
    When I navigate to the Report It page
    And I choose to place an Advertising and trading report for A Boards (Sandwich Boards)
    And I fill in all the details and select the preferred contact Email
    Then I check the mandatory field error messages
    When I navigate to the Report It page
    And I choose to place an Advertising and trading report for A Boards (Sandwich Boards)
    And I fill in all the details and select the preferred contact Phone
    Then I check the mandatory field error messages

