RSpec.describe Api::Models::Napicer, type: :model do
  context 'associations' do
    specify { is_expected.to have_many_to_many(:skills) }
  end

  context 'validations' do
    specify { is_expected.to validate_presence(:first_name) }
    specify { is_expected.to validate_presence(:last_name) }
    specify { is_expected.to validate_presence(:username) }
  end
end
