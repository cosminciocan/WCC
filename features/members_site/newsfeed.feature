Feature: This feature contains tests involving the News Feed function

  Background: Verify if a test News Feed is present, and if not, create one
    Given I access the homepage
    Then I check if a test "News Feed" is created, and if not, I create one

  Scenario: View a newsfeed
    Given I access the homepage
    When I select a newsfeed
    Then I should see the content

  Scenario: Deleting the created Quick Answer
    Given I login with valid Administrator user
    Then I delete the created content


