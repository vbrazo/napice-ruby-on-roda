FactoryBot.define do
  factory :napicer, class: Api::Models::Napicer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    username { Faker::Name.first_name.downcase }
    nickname { Faker::Name.first_name.downcase }

    association :user
  end
end
