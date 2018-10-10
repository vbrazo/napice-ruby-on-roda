FactoryBot.define do
  factory :napicer_education, class: Api::Models::NapicerEducation do
    school { Faker::Educator.university }
    degree { Faker::Educator.degree }
    self_description { Faker::Lorem.word }

    napicer
  end
end
