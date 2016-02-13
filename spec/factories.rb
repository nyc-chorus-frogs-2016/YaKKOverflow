FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password "password"
  end

  factory :response do
    content { Faker::Lorem.paragraph }
  end

  factory :answer do
    content { Faker::Lorem.paragraph }
  end

  factory :question do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end

end
