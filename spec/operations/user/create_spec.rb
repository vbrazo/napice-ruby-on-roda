RSpec.describe Api::Operations::User::Create do
  describe '#create' do
    let(:user) do
      {
        'email' => Faker::Internet.email
      }
    end

    it 'adds record successfully' do
      expect do
        subject.call(user_hash: user)
      end.to(change { Api::Models::User.count }.by(1))
    end

    it 'returns success status' do
      result = subject.call(user_hash: user)
      expect(result).to eq({ success: true })
    end

    context 'with invalid input' do
      it 'raises error when user_hash is nil' do
        expect do
          subject.call(user_hash: nil)
        end.to raise_error(ArgumentError, 'user_hash cannot be empty')
      end

      it 'raises error when user_hash is empty' do
        expect do
          subject.call(user_hash: {})
        end.to raise_error(ArgumentError, 'email is required')
      end

      it 'raises error when email is missing' do
        expect do
          subject.call(user_hash: { 'name' => 'Test' })
        end.to raise_error(ArgumentError, 'email is required')
      end
    end

    context 'with invalid email format' do
      it 'raises validation error' do
        expect do
          subject.call(user_hash: { 'email' => 'invalid_email' })
        end.to raise_error(Sequel::ValidationFailed)
      end
    end

    context 'with duplicate email' do
      before do
        Api::Models::User.create(email: 'test@example.com')
      end

      it 'raises validation error' do
        expect do
          subject.call(user_hash: { 'email' => 'test@example.com' })
        end.to raise_error(Sequel::ValidationFailed)
      end
    end
  end
end
