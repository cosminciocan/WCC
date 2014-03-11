Feature: This feature contains tests involving the Pre-Application advice functionality

  Scenario: Submitting a pre-planning advice form (Household)
    Given I access the homepage
    When I navigate to the pre-application advice page
    And I enter the postcode "SW1E 6QP"
    And I select an address from the dropdown
    Then I proceed to the next step
    And I enter a description
    And I proceed to the final step
    And I fill in all the mandatory fields
    And I select to pay on behalf of the client
    When I submit my application
    Then A confirmation page is displayed

