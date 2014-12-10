Feature: home page feature
  In order to display home page right
  As a Symfony2 developer
  I need to be able to see home page

  @javascript
  Scenario: User clicks "Home" navigation link on home page
    Given I am on "/"
    When I follow "Home"
    Then I should see "Symfony2 Blog"
    Then I should see "Symfony2 tutorials"
  
  @javascript 
  Scenario:	Check main content of homepage
    Given I am on "/"
    When I follow "Home"
    Then I should see "List Of Posts"
