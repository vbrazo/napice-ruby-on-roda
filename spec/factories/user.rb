FactoryBot.define do
  factory :user, class: Api::Models::User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Lorem.word }
    email { Faker::Internet.email }
  end
end
