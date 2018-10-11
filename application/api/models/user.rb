class Api
  module Models
    class User < Sequel::Model(:user)
      plugin :json_serializer
      
      one_to_one :napicer, class_name: 'Api::Models::Napicer', foreign_key: :user_id

      def validate
        super

        validates_presence %i[email]
      end
    end
  end
end
