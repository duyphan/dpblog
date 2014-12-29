Given /^(@\w+) exists?$/ do |email|
  @me ||= FactoryGirl.create(:user, :email => "email")
end

Given /^@(\w+) exists and is logged in$/ do |email|
  step(%(@#{email} exists))
end