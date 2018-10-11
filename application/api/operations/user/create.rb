class Api
  module Operations
    module User
      class Create
        def initialize(user:)
          @user = user
        end

        attr_reader :user

        def create
          Models::User.create(user_hash)
        end

        private

        def user_hash
          {
            email: user['email']
          }
        end
      end
    end
  end
end
