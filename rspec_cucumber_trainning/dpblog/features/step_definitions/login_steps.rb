When(/^I click to "(.*?)" button$/) do |btnLogin|
	click_link(btnLogin)
  # pending # express the regexp above with the code you wish you had
end

Then(/^I am on the Login page$/) do
	page.should have_content("Log In")
	page.should have_content("Email")
	page.should have_content("Password")
  # pending # express the regexp above with the code you wish you had
end

Given(/^I am on the login page$/) do
  visit new_session_path
end

Given(/^a user with username "(.*?)" and password "(.*?)"$/) do |email, password|
  @me ||= FactoryGirl.create(:user, :email => email, :password => password)
  @me.reload
end

When(/^I sign in manually as "(.*?)" with password "(.*?)"$/) do |email, password|
  
  @me = User.find_by_email(email)
  @me.password ||= password
  
  visit new_session_path

  fill_in 'email', :with => email
  fill_in 'password', :with => password
  click_link "Log In"

  page.has_content?("Logged In!")
  
  # confirm_login
end

Given(/^I am signed in$/) do
  automatic_login
  confirm_login
end

# Given(/^I click on my name in the header$/) do
#   pending # express the regexp above with the code you wish you had
# end

# Given(/^I follow "(.*?)"$/) do |arg1|
#   pending # express the regexp above with the code you wish you had
# end

# Then(/^I should be on the new user session page$/) do
#   pending # express the regexp above with the code you wish you had
# end
