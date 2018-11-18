class Api
  module Models
    class Skill < Sequel::Model(:skill)
      plugin :json_serializer

      one_to_many :napicer_skill, class_name: 'Api::Models::NapicerSkill', key: :skill_id

      def validate
        super

        validates_presence %i(name)
      end
    end
  end
end
