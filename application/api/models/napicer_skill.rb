class Api
  module Models
    class NapicerSkill < Sequel::Model(:napicer_skill)
      many_to_one :napicer, class_name: 'Api::Models::Napicer', key: :napicer_id
      many_to_one :skill, class_name: 'Api::Models::Skill', key: :skill_id

      def validate
        super

        validates_presence %i[napicer_id skill_id]
      end
    end
  end
end
