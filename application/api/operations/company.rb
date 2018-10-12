class Api
  module Operations
    class Company
      def demo(company:)
        Models::Demo.create(company)
      end
    end
  end
end
