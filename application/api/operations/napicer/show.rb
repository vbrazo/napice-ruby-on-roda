class Api
  module Operations
    module Napicer
      class Show < Base
        process do
          step :show
        end

        def show(napicer_hash:)
          Models::Napicer.first(id: napicer_hash['id'])
        end
      end
    end
  end
end
