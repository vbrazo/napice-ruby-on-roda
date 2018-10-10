RSpec.describe Api::Models::User, type: :model do
  context 'associations' do
    specify { is_expected.to have_one_to_one(:napicer) }
  end

  context 'validations' do
    specify { is_expected.to validate_presence(:email) }
  end
end
