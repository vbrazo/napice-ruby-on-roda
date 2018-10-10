RSpec.describe Api::Models::Demo, type: :model do
  context 'validations' do
    specify { is_expected.to validate_presence(:first_name) }
    specify { is_expected.to validate_presence(:last_name) }
    specify { is_expected.to validate_presence(:email) }
    specify { is_expected.to validate_presence(:phone) }
    specify { is_expected.to validate_presence(:company_name) }
    specify { is_expected.to validate_presence(:company_website) }
  end
end
