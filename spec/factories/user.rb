FactoryBot.define do
  factory :user, class: Api::Models::User do
    email { Faker::Internet.email }
  end
end
