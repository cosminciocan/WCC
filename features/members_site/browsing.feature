Feature: Browsing on the site

  Scenario: Access Homepage
    When I access the homepage
    Then I see the homepage content

  Scenario Outline: Browsing the footer links, and checking if they open in a new window
    Given I access the homepage
    And I click on the <link> link
    Then the <page> page should be displayed

  Examples:
    |link  | page |
    | Disclaimer | Disclaimer|
    | Privacy    | Website Privacy Policy |
    | Freedom of Information | Freedom of Information |
    | Copyright              | Copyright              |
    | Accessibility          | Accessibility          |
    | Terms and conditions   | Terms and conditions   |
    | Cookies                | Website Privacy Policy |

  Scenario: Verify the time on the homepage
    Given I access the homepage
    Then I should see the correct UK time

#    @not_started
#  Scenario: Browsing All you need to know.. homepage collections
#    Given I access the homepage
#    When I click on the All you need to know about collections
#    #Then I should be redirected to the collection page
#
#  @not_started
#  Scenario: Check the related links box
#    Given I access the homepage
#    And I navigate to the planning collection page
#    And I select the first collection item
#    Then I see the other relevant links box