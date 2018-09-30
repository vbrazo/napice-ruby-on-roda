FactoryBot.define do
  factory :skill, class: Api::Models::Skill do
    name { Faker::Lorem.word }
  end
end
