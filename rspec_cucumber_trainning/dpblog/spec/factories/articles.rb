require 'faker'

FactoryGirl.define do 
	factory :article do |f| 
		f.association :user
		f.title { Faker::Lorem.sentence }
		f.text { Faker::Lorem.paragraph }

		factory :invalid_article do
      title nil
    end
	end 
end