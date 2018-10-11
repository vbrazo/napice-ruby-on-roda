class Api
  module Operations
    class Company
      def demo(company:)
        Models::Demo.create(demo_hash(company))
      end

      private

      def demo_hash(demo)
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
