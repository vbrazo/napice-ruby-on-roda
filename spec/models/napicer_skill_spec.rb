require 'spec_helper'

RSpec.describe Api::Models::NapicerSkill, type: :model do
  context 'associations' do
    specify { is_expected.to have_many_to_one(:napicer) }
    specify { is_expected.to have_many_to_one(:skill) }
  end

  context 'validations' do
    specify { is_expected.to validate_presence(:napicer_id) }
    specify { is_expected.to validate_presence(:skill_id) }
  end
end
