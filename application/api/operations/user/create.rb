class Api
  module Operations
    module User
      class Create < Base
        process do
          step :create
          step :success
        end

        def create(user_hash:)
          Models::User.create(user_hash)
        end
      end
    end
  end
end
