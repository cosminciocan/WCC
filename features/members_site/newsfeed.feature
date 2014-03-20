Feature: This feature contains tests involving the News Feed function

  Background: Verify if a test News Feed is present, and if not, create one
    Given I access the homepage
    Then I check if a test "News Feed" is created, and if not, I create one

  Scenario: View a newsfeed
    Given I access the homepage
    When I navigate to a News Feed page
    Then I should see the content

  Scenario: Browse a newsfeed
    Given I access the homepage
    Then I should see the news feeds at the bottom of the page
    And I should be able to select one
    Then I should be able to see its content

  Scenario: Select More Newsfeeds
    Given I access the homepage
    Then I should see the news feeds at the bottom of the page
    And I can select More News
    Then A page with all the latest news should be displayed
    And I can select which news I want to read
    Then I should be able to see its content


  Scenario: Deleting the created News Feed
    Given I login with valid Administrator user
    Then I delete the created content



