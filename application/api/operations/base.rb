class Api
  module Operations
    class Base
      class Builder
        attr_reader :steps

        def initialize
          @steps = []
        end

        def step(method_name)
          @steps << method_name
        end

        def method_missing(method_name, *args, &block)
          if method_name == :step && args.length == 1
            @steps << args[0]
          else
            super
          end
        end

        def respond_to_missing?(method_name, *args)
          method_name == :step || super
        end
      end

      def run(input = nil, &block)
        response = nil

        builder = Builder.new
        builder.instance_eval(&block) if block_given?

        builder.steps.each do |step_name|
          # Check if the method accepts parameters
          method_obj = method(step_name)
          
          response = if method_obj.arity == 0 || (input.nil? || input.empty?)
                       send(step_name)
                     else
                       send(step_name, **input)
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
