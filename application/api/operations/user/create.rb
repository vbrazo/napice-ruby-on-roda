class Api
  module Operations
    module User
      class Create < Base
        process do
          step :validate_input
          step :create
          step :success
        end

        def validate_input(user_hash:)
          raise ArgumentError, 'user_hash cannot be empty' if user_hash.nil?
          raise ArgumentError, 'email is required' if user_hash.empty? || !(user_hash['email'] || user_hash[:email])
        end

        def create(user_hash:)
          Models::User.create(user_hash)
        end
      end
    end
  end
end
