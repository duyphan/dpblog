Given /^(@\w+) exists?$/ do |email|
  @me ||= FactoryGirl.create(:user, :email => "email")
end

Given /^@(\w+) exists and is logged in$/ do |email|
  step(%(@#{email} exists))
end

When(/^I follow "(.*?)"$/) do |btn|
  click_link btn
end

Then(/^I am on the new artile page$/) do
	visit new_article_path
end

When(/^I fill in title with "(.*?)"$/) do |arg1|
  fill_in 'article_title', :with => arg1
end

When(/^I fill in text with "(.*?)"$/) do |arg1|
  fill_in 'article_text', :with => arg1
end

# When(/^I press "(.*?)"$/) do |btn|
#   click_link btn
# end

Then(/^I should see "(.*?)" text$/) do |text|
  page.should have_content(text)
end