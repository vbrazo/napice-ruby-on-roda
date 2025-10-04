class Api
  module Models
    class NapicerEducation < Sequel::Model(:napicer_education)
      plugin :json_serializer
      plugin :timestamps, update_on_create: true

      many_to_one :napicer, class_name: 'Api::Models::Napicer', key: :napicer_id

      def validate
        super

        validates_presence [:napicer_id, :school, :degree, :self_description]
        validates_integer :napicer_id
      end
    end
  end
end
