Given(/^there's a post titled "(.*?)" with "(.*?)" content$/) do |title, content|
  @post = FactoryGirl.create(:article, title: title, text: content)
end

When(/^I am on the homepage$/) do
  visit root_path
end

Then(/^I should see the "(.*?)" article$/) do |article|
  @post = Article.find_by_title(article)

  page.should have_content(@post.title)
  page.should have_content(@post.text)
end

Then(/^I should see the "(.*?)" title$/) do |title|
  page.should have_content(title)
end