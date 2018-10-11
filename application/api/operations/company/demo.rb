class Api
  module Operations
    module Company
      class Demo
        def initialize(demo:)
          @demo = demo
        end

        attr_reader :demo

        def create
          Models::Demo.create(user_hash)
        end

        private

        def user_hash
          {
            first_name: demo['first_name'],
            last_name: demo['last_name'],
            email: demo['email'],
            phone: demo['phone'],
            company_name: demo['company_name'],
            company_website: demo['company_website']
          }
        end
      end
    end
  end
end
