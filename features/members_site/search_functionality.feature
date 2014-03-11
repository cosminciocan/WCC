Feature: This feature contains the tests for the search functionality

  Scenario: Simple search by keyword
    Given I access the homepage
    And I enter the keyword "parking"
    When I press the search button
    Then the result page is shown with results for my keyword

  Scenario: Simple search by keyword, using the autocomplete suggestions
    Given I access the homepage
    And I enter the keyword "parkin"
    Then A suggestion box is displayed under the search field
    When I select a suggestion from the drop-down
    And the result page is shown with results for my keyword

  Scenario: Simple search with no results
    Given I access the homepage
    And I enter the keyword "asdfghjasd"
    When I press the search button
    Then the result page is displayed without any results
    And Some tips are displayed on the page

  Scenario: Simple search with no keywords
     Given I access the homepage
     When I press the search button
     Then the result page is displayed without any results
     And A mandatory error message is displayed


