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

Then(/^I am on the homepage page$/) do
  visit root_path
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
  confirm_login
end

Given(/^I am signed in$/) do
  automatic_login
  confirm_login
end

Then(/^I should be on the article page$/) do
  confirm_article_page
end

Given(/^have some accounts$/) do |accounts|
  accounts.hashes.each do |row|
    FactoryGirl.create(:user, :email => row['email'], :password => row['password'])
  end
end

When(/^I sign in with accounts$/) do |accounts|
  accounts.hashes.each do |row|
    @me = User.find_by_email(row['email'])
    @me.password ||= row['password']
    visit new_session_path

    fill_in 'email', :with => row['email']
    fill_in 'password', :with => row['password']
    click_link "Log In"
    confirm_login
  end
end