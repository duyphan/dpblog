Feature: layout feature
  In order to display blog site
  As a Symfony2 developer
  I need create template include : logo - sidebar - header - footer

  @javascript
  Scenario Outline: Check sidebar
    Given I am on "<url>"    
    Then I should see "Tag Cloud"
    Then I should see "Latest Comments"

    Examples:
      | url          | explanation    |
      | /            | home page    |
      | /about       | about page    |
      | /contact     | contact page    |

  @javascript
  Scenario Outline: Check footer
    Given I am on "<url>"    
    Then I should see "Symfony2 blog tutorial - created by"

    Examples:
      | url          | explanation    |
      | /            | home page    |
      | /about       | about page    |
      | /contact     | contact page    |
  
  @javascript
  Scenario Outline: Check header
    Given I am on "<url>"    
    Then I should see "Home"
    Then I should see "About"
    Then I should see "Contact"

    Examples:
      | url          | explanation    |
      | /            | home page    |
      | /about       | about page    |
      | /contact     | contact page    |

  @javascript
  Scenario Outline: Check logo and subtitle
    Given I am on "<url>"    
    Then I should see "Symfony2 Blog"
    Then I should see "Symfony2 tutorials"

    Examples:
      | url          | explanation    |
      | /            | home page    |
      | /about       | about page    |
      | /contact     | contact page    |