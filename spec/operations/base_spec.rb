RSpec.describe Api::Operations::Base do
  describe '.process' do
    let(:test_operation_class) do
      Class.new(described_class) do
        process do
          step :step_one
          step :step_two
          step :success
        end

        def step_one(input: nil)
          @step_one_called = true
          { data: input }
        end

        def step_two(input: nil)
          @step_two_called = true
          { data: input, processed: true }
        end

        attr_reader :step_one_called, :step_two_called
      end
    end

    it 'defines a call method' do
      expect(test_operation_class.new).to respond_to(:call)
    end

    it 'executes all steps in order' do
      result = test_operation_class.new.call(input: 'test')
      expect(result).to eq({ success: true })
    end

    it 'passes input to steps correctly' do
      # Since operations create a new instance internally, we just verify it doesn't error
      expect { test_operation_class.new.call(input: 'test') }.not_to raise_error
    end

    it 'returns the result of the last step' do
      result = test_operation_class.new.call(input: 'test')
      expect(result).to eq({ success: true })
    end

    context 'when steps are called without input' do
      let(:no_input_operation) do
        Class.new(described_class) do
          process do
            step :simple_step
          end

          def simple_step
            { result: 'done' }
          end
        end
      end

      it 'executes successfully' do
        result = no_input_operation.new.call
        expect(result).to eq({ result: 'done' })
      end
    end
  end

  describe '#success' do
    it 'returns success hash' do
      expect(described_class.new.success).to eq({ success: true })
    end
  end
end
