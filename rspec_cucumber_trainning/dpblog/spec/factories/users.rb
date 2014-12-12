FactoryGirl.define do
  factory :user do |f|
    f.firstname { Faker::Name.first_name }
		f.lastname { Faker::Name.last_name }
		f.email { Faker::Internet.email }
		password 'secret'
    password_confirmation { password }

    factory :admin do
      admin true
    end
  end
end
