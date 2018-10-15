class Api
  module Operations
    module Napicer
      class ShowAll < Base
        process do
          step :show_all
        end

        def show_all
          Models::Napicer.all
        end
      end
    end
  end
end
