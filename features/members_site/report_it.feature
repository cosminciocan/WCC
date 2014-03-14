Feature: This feature contains scenarios for the Report It functionality

  Scenario: Basic Report It flow - Roads and pavements, without contact details
    Given I access the homepage
    When I navigate to the Report It page
    And I submit a Roads and pavements report
    Then I should receive a confirmation message