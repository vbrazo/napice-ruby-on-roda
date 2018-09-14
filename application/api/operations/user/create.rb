class Api
  module Operations
    module User
      class Create
        def new(args = {})
          @args = args
        end

        attr_reader :args

        def create
          user = Models::User.create(args)

          user.id
        end
      end
    end
  end
end
