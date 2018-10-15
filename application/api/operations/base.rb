class Api
  module Operations
    class Base
      class Builder
        attr_reader :attributes

        def initialize
          @attributes = []
        end

        def method_missing(method_name, *args, &block)
          if method_name.is_a? Symbol
            @attributes << args[0]
          else
            super
          end
        end

        def respond_to_missing?(method_name, *args)
          method_name.is_a?(Symbol) || super
        end
      end

      def run(input = nil, &block)
        response = []

        builder = Builder.new
        builder.instance_eval(&block) if block_given?

        builder.attributes.each do |value|
          response = if value == :success || input.empty?
                       send(value)
                     else
                       send(value, input)
                     end
        end

        response
      end

      def success
        { success: true }
      end

      def self.process(&block)
        dsl = self

        define_method(:call) do |**input|
          dsl.new.run(input, &block)
        end
      end
    end
  end
end
