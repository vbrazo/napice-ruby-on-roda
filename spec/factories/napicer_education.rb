FactoryBot.define do
  factory :napicer_education, class: Api::Models::NapicerEducation do
    school { Faker::Lorem.word }
    degree { Faker::Lorem.word }
    self_description { Faker::Lorem.word }

    napicer
  end
end
