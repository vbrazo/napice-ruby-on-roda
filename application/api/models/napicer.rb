class Api
  module Models
    class Napicer < Sequel::Model(:napicer)
      plugin :json_serializer
      plugin :timestamps, update_on_create: true

      many_to_many :skills,
                   class_name: 'Api::Models::Skill',
                   left_key: :napicer_id,
                   right_key: :skill_id,
                   join_table: :napicer_skill
      one_to_many :napicer_education,
                  class_name: 'Api::Models::NapicerEducation',
                  key: :napicer_id
      one_to_many :napicer_experience,
                  class_name: 'Api::Models::NapicerExperience',
                  key: :napicer_id
      one_to_many :napicer_skills,
                  class_name: 'Api::Models::NapicerSkill',
                  key: :napicer_id
      many_to_one :user, class_name: 'Api::Models::User', key: :user_id

      def validate
        super

        validates_presence [:first_name, :last_name, :username]
        validates_unique :username
      end
    end
  end
end
