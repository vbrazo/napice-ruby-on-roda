class Api
  module Operations
    class User
      def create(user:)
        Models::User.create(user_hash(user))
      end

      private

      def user_hash(user)
        {
          email: user['email']
        }
      end
    end
  end
end
