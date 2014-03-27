Feature: Admin creating content


 Scenario: Creating Quick Answer
  Given I login with valid Administrator user
  When I create a Quick answer content type
  And I verify the created content
  Then I delete the created content

Scenario: test scenario
   Given I login with valid Administrator user
   And I create a test category
   When I create a Random Named Quick answer content type
   When I create a Quick answer content type
   And I verify the created content
   Then I delete the created content

