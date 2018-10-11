class Api
  module Models
    class NapicerExperience < Sequel::Model(:napicer_experience)
      plugin :json_serializer
      
      many_to_one :napicer, class_name: 'Api::Models::Napicer', key: :napicer_id

      def validate
        super

        validates_presence %i[napicer_id title location self_description]
      end
    end
  end
end
