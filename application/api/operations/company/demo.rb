class Api
  module Operations
    module Company
      class Demo < Base
        process do
          step :demo
          step :success
        end

        def demo(company_hash:)
          Models::Demo.create(company_hash)
        end
      end
    end
  end
end
