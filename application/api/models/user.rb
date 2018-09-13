class Api
  module Models
    class User < Sequel::Model(:user)
      def validate
        super

        validates_presence %i[id first_name last_name username email]
      end
    end
  end
end
