class Api
  module Operations
    class Napicer
      def show(napicer:)
        Models::Napicer.first(id: napicer['id'])
      end

      def show_all
        Models::Napicer.all
      end
    end
  end
end
