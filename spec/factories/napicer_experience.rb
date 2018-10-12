FactoryBot.define do
  factory :napicer_experience, class: Api::Models::NapicerExperience do
    title { Faker::Lorem.word }
    location { Faker::Lorem.word }
    self_description { Faker::Lorem.word }

    association :napicer
  end
end
