class Api
  module Models
    class Napicer < Sequel::Model(:napicer)
      plugin :json_serializer

      many_to_many :skills,
                   class_name: 'Api::Models::Skill',
                   left_key: :napicer_id,
                   right_key: :skill_id,
                   join_table: :napicer_skill
      one_to_many :napicer_education,
                  class_name: 'Api::Models::NapicerEducation',
                  key: :napicer_education_id
      one_to_many :napicer_experience,
                  class_name: 'Api::Models::NapicerExperience',
                  key: :napicer_experience_id
      one_to_many :napicer_skill,
                  class_name: 'Api::Models::NapicerSkill',
                  key: :skill_id
      many_to_one :user, class_name: 'Api::Models::User', key: :user_id

      def validate
        super

        validates_presence %i(first_name last_name username)
      end
    end
  end
end
