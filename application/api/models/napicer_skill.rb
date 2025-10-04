class Api
  module Models
    class NapicerSkill < Sequel::Model(:napicer_skill)
      plugin :json_serializer
      plugin :timestamps, update_on_create: true

      many_to_one :napicer, class_name: 'Api::Models::Napicer', key: :napicer_id
      many_to_one :skill, class_name: 'Api::Models::Skill', key: :skill_id

      def validate
        super

        validates_presence [:napicer_id, :skill_id]
        validates_integer :napicer_id
        validates_integer :skill_id
        validates_unique [:napicer_id, :skill_id], message: 'combination already exists'
      end
    end
  end
end
