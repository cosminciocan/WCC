Feature: This feature contains tests involving the Pre-Application advice functionality

  Scenario: Submitting a pre-planning advice form (Household)
    Given I access the homepage
    When I navigate to the pre-application advice page
    And I enter the postcode "SW1E 6QP"
    And I select Find Address
    And I select an address from the dropdown
    Then I proceed to the next step
    And I enter a description
    And I proceed to the final step
    And I fill in all the contact details
    And I select to pay on behalf of the client
    When I submit my application
    Then A confirmation page is displayed

  Scenario: Cheking the mandatory fields validation on step 1
    Given I access the homepage
    When I navigate to the pre-application advice page
    And I proceed to the next step
    Then I can't proceed forward
    And The error message "Postcode field is required." should be displayed
    And The error message "Address field is required." should be displayed
    When I enter the postcode "SW1E 6QP"
    And I select Find Address
    And I proceed to the next step
    Then I can't proceed forward
    And The error message "Address field is required." should be displayed
    When I enter the postcode "SW1E 6QP"
    And I select Find Address
    And I select an address from the dropdown
    And I enter the postcode ""
    And I proceed to the next step
    Then I can't proceed forward
    And The error message "Postcode field is required." should be displayed

  Scenario: Cheking the postcode field validations from step 1
    Given I access the homepage
    When I navigate to the pre-application advice page
    And I enter the postcode "ZZZ ZZZ"
    And I select Find Address
    Then A pop-up alert should be displayed
    And The text from the alert should read "Please enter a Westminster Postcode."
    When I enter the postcode ""
    And I select Find Address
    Then A pop-up alert should be displayed
    And The text from the alert should read "Please supply a complete and valid Postcode"

  Scenario: Checking the mandatory field validation on step 2
    Given I access the homepage
    When I navigate to the pre-application advice page
    And I enter the postcode "SW1E 6QP"
    And I select Find Address
    And I select an address from the dropdown
    Then I proceed to the next step
    When I proceed to the final step
    Then The error message "This field cannot be empty." should be displayed

  Scenario: Checking the mandatory fields validations on step 3
    Given I access the homepage
    When I navigate to the pre-application advice page
    And I enter the postcode "SW1E 6QP"
    And I select Find Address
    And I select an address from the dropdown
    Then I proceed to the next step
    And I enter a description
    And I proceed to the final step
    When I submit my application
    Then I can't proceed forward
    And The error message "Name field is required." should be displayed
    And The error message "Postcode field is required." should be displayed
    And The error message "Address field is required." should be displayed
    And The error message "Phone number field is required." should be displayed
    And The error message "Email field is required." should be displayed

  Scenario: Checking the email format validation on step 3
    Given I access the homepage
    When I navigate to the pre-application advice page
    And I enter the postcode "SW1E 6QP"
    And I select Find Address
    And I select an address from the dropdown
    Then I proceed to the next step
    And I enter a description
    And I proceed to the final step
    And I fill in all the contact details
    And I select to pay on behalf of the client
    And The billing details are not the same as contact details
    When I enter an incorrect email format
    And I enter an incorrect billing email format
    And I submit my application
    Then I can't proceed forward
    And The error message "Please enter a correct email address." should be displayed
    And The error message "Please enter a correct billing email address." should be displayed
    And I select not to pay on behalf of the client
    And I enter an incorrect client billing email format
    And I submit my application
    Then I can't proceed forward
    And The error message "Please enter a correct client email address." should be displayed


  Scenario: Submitting a pre-planning advice form (Household), billing details not the same
    Given I access the homepage
    When I navigate to the pre-application advice page
    And I enter the postcode "SW1E 6QP"
    And I select Find Address
    And I select an address from the dropdown
    Then I proceed to the next step
    And I enter a description
    And I proceed to the final step
    And I fill in all the contact details
    And I select to pay on behalf of the client
    And The billing details are not the same as contact details
    When I fill in all the billing details
    And I submit my application
    Then A confirmation page is displayed

  Scenario: Submitting a pre-planning advice form (Household), with client billing details
    Given I access the homepage
    When I navigate to the pre-application advice page
    And I enter the postcode "SW1E 6QP"
    And I select Find Address
    And I select an address from the dropdown
    Then I proceed to the next step
    And I enter a description
    And I proceed to the final step
    And I fill in all the contact details
    And I select not to pay on behalf of the client
    Then I fill in all the client billing details
    And I submit my application
    Then A confirmation page is displayed



