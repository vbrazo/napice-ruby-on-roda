require 'spec_helper'

RSpec.describe Api::Models::User, type: :model do
  context 'validations' do
    specify { is_expected.to validate_presence(:first_name) }
    specify { is_expected.to validate_presence(:last_name) }
    specify { is_expected.to validate_presence(:username) }
    specify { is_expected.to validate_presence(:email) }
  end
end
