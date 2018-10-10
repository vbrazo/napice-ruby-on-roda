RSpec.describe Api::Models::NapicerExperience, type: :model do
  context 'associations' do
    specify { is_expected.to have_many_to_one(:napicer) }
  end

  context 'validations' do
    specify { is_expected.to validate_presence(:napicer_id) }
    specify { is_expected.to validate_presence(:title) }
    specify { is_expected.to validate_presence(:location) }
    specify { is_expected.to validate_presence(:self_description) }
  end
end
