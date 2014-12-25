Feature: Login
	In order to use application
  A visitor
 	Should login

  @login
  Scenario: Go to login page from home page
  	Given I am on the homepage
  	When I click to "Log In" button
  	Then I am on the Login page

  @login
	Scenario: user logs in
    Given a user with username "pduy1206@gmail.com" and password "secret"
    When I sign in manually as "pduy1206@gmail.com" with password "secret"
    Then I should be on the article page

  @login
  Scenario: user logs in some account
    Given have some accounts
    | email                      | password |
    | duy.phan@asnet.com.vn      | secret   |
    | pduy1206@gmail.com         | secret   |
    | duyphan_uh@yahoo.com.vn    | secret   |
    | phanduy120689@gmail.com    | secret   |
    
    When I sign in with accounts
    | email                      | password |
    | pduy1206@gmail.com         | secret   |
    | duyphan_uh@yahoo.com.vn    | secret   |
    | phanduy120689@gmail.com    | secret   |

    Then I should be on the article page

  @login
  Scenario Outline: user logs in some account 2
    Given a user with username "<email>" and password "<password>"
    When I sign in manually as "<email>" with password "<password>"
    Then I should be on the article page

    Examples:
    | email                      | password |
    | duy.phan@asnet.com.vn      | secret   |
    | phanduy120689@gmail.com    | secret   |