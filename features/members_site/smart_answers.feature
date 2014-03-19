Feature: This feature contains tests involving the Smart Answers functionality

  Background: Verify if a test smart answer form exists, and if not, create one
    Given I access the homepage
    Then I check if a test "Standard Smart Answer" is created, and if not, I create one

  Scenario: Simple flow on a Smart Answer form with a multiple choice question, a date question and a result
     Given I access the homepage
     When I navigate to a Smart Answer form
     And I complete a flow for it
     Then The result for the Smart Answer should be displayed

  Scenario: Deleting the created Smart Answer
     Given I login with valid Administrator user
     Then I delete the created content