FactoryBot.define do
  factory :napicer_skill, class: Api::Models::NapicerSkill do
    napicer
    skill
  end
end
