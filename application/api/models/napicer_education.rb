class Api
  module Models
    class NapicerEducation < Sequel::Model(:napicer_education)
      plugin :json_serializer
      
      many_to_one :napicer, class_name: 'Api::Models::Napicer', key: :napicer_id

      def validate
        super

        validates_presence %i[napicer_id school degree self_description]
      end
    end
  end
end
