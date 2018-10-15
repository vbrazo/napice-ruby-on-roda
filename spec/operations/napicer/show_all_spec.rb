RSpec.describe Api::Operations::Napicer::ShowAll do
  describe '#show_all' do
    before do
      create_list(:napicer, 30)
      create_list(:napicer, 3)
    end

    it 'returns records successfully' do
      records = subject.call

      expect(records.count).to eq(33)
    end
  end
end
