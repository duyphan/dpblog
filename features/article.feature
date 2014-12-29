Feature: Article
	
	Background: 
    Given a user with username "pduy1206@gmail.com" and password "secret"
    When I sign in manually as "pduy1206@gmail.com" with password "secret"
    Then I should be on the article page

	@create
	Scenario: User creates a valid article list on website
    Given a user with username "pduy1206@gmail.com" and password "secret"
    When I sign in manually as "pduy1206@gmail.com" with password "secret"
    Then I am on the homepage
    When I follow "My Blog"
    Then I should be on the article page
    And I follow "New article"
    Then I am on the new artile page
    And I should see "Title" text
    # And I fill in title with "Finish Writing Specs"
    # And I fill in text with "Finish Writing Specs text"
    # And I press "Save Article"
    # Then I should see "Finish Writing Specs" text
    # And I should see "Finish Writing Specs" text

	# @edit

	# @delete