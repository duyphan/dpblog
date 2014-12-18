Feature: Login
	In order to use application
  A visitor
 	Should login

  Scenario: Go to login page from home page
  	Given I am on the homepage
  	When I click to "Log In" button
  	Then I am on the Login page

	Scenario: user logs in
	    Given a user with username "pduy1206@gmail.com" and password "secret"
	    When I sign in manually as "pduy1206@gmail.com" with password "secret"

  Scenario: user logs out
    Given I am signed in
    # And I click on my name in the header
    # And I follow "Log out"
    # Then I should be on the new user session page