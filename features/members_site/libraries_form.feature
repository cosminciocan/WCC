Feature: Testing the libraries form

  Background: Access the libraries form
    Given I access the homepage
    And I navigate to a library form

  Scenario: Checking the mandatory fields validations
    When I select to submit the form without filling the fields
    Then I can't proceed forward
    And The error message "First Name field is required." should be displayed
    And The error message "Surname field is required." should be displayed
    And The error message "Email field is required." should be displayed
    And The error message "Address line 1 field is required." should be displayed
    And The error message "Post Code field is required." should be displayed
    And The error message "Select the library where you would like to collect your card from field is required." should be displayed

