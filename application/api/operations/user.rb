class Api
  module Operations
    class User
      def create(user:)
        Models::User.create(user)
      end
    end
  end
end
