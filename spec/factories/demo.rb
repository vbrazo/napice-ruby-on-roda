FactoryBot.define do
  factory :demo, class: Api::Models::Demo do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    company_name { Faker::Company.name }
    company_website { Faker::Internet.url }
  end
end
