class Api
  module Operations
    module Company
      class Demo < Base
        process do
          step :validate_input
          step :demo
          step :success
        end

        def validate_input(company_hash:)
          raise ArgumentError, 'company_hash cannot be empty' if company_hash.nil? || company_hash.empty?
        end

        def demo(company_hash:)
          Models::Demo.create(company_hash)
        end
      end
    end
  end
end
