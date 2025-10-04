class Api
  module Models
    class Demo < Sequel::Model(:demo)
      plugin :json_serializer
      plugin :timestamps, update_on_create: true

      def validate
        super

        validates_presence [:first_name, :last_name, :email, :phone, :company_name, :company_website]
        validates_format(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :email, message: 'is not a valid email') if email
        validates_format(/^https?:\/\/.+/i, :company_website, message: 'is not a valid URL') if company_website
      end
    end
  end
end
