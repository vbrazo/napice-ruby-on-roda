class Api
  module Models
    class Napicer < Sequel::Model(:napicer)
      many_to_many :skills, class_name: 'Api::Models::Skill', left_key: :napicer_id,
                            right_key: :skill_id, join_table: :napicer_skill

      def validate
        super

        validates_presence %i[first_name last_name username]
      end
    end
  end
end
