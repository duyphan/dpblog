Feature: Home page

  Scenario: Viewing application's home page
    Given there's a post titled "My first A" with "Hello, BDD world!" content
    When I am on the homepage
    Then I should see the "My first A" article