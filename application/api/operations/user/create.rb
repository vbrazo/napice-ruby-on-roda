class Api
  module Operations
    module User
      class Create
        def initialize(args = {})
          @args = args
        end

        attr_reader :args

        def create
          Api::Models::User.create(user_hash)
        end

        private

        def user_hash
          {
            first_name: args['first_name'],
            last_name: args['last_name'],
            username: args['username'],
            email: args['email']
          }
        end
      end
    end
  end
end
