factories.rb

require 'factory_girl'
require 'faker'
FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { Faker::Internet.password }
  end

  factory :article do
    name { Faker::Lorem.word }
    neighborhood { Faker::Lorem.word }
    trash { Faker::Lorem.boolean }
    gold { Faker::Lorem.boolean }
  end

  factory :comment do
    body { Faker::Lorem.paragraph }
    user
    article
  end
end
