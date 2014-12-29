Feature: Home page

  Scenario: Viewing application's home page
    When I am on the homepage
    Then I should see the "Welcome DP Blog" title
    And I should see the "To be or not to be that is the question" title
