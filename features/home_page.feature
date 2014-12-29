Feature: Home page

  Scenario: Viewing application's home page
    When I am on the homepage
    Then I should see the "Welcome DP Blog" title
    And I should see the "To be or not to be that is the question" title

  Scenario: See the button to come Blog
  	When I am on the homepage
  	Then I should see the "My Blog" button
  	And I click to "My Blog" button
  	Then I am on the article page