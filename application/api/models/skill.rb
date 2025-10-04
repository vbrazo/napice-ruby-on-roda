class Api
  module Models
    class Skill < Sequel::Model(:skill)
      plugin :json_serializer
      plugin :timestamps, update_on_create: true

      one_to_many :napicer_skills, class_name: 'Api::Models::NapicerSkill', key: :skill_id
      many_to_many :napicers,
                   class_name: 'Api::Models::Napicer',
                   left_key: :skill_id,
                   right_key: :napicer_id,
                   join_table: :napicer_skill

      def validate
        super

        validates_presence :name
        validates_unique :name
      end
    end
  end
end
