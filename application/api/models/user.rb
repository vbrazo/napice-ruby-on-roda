class Api
  module Models
    class User < Sequel::Model(:user)
      plugin :json_serializer
      plugin :timestamps, update_on_create: true

      one_to_one :napicer, class_name: 'Api::Models::Napicer', key: :user_id

      def validate
        super

        validates_presence :email
        validates_unique :email
        validates_format(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :email, message: 'is not a valid email')
      end
    end
  end
end
