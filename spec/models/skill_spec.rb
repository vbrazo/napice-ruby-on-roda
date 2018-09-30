require 'spec_helper'

RSpec.describe Api::Models::Skill, type: :model do
  context 'associations' do
    specify { is_expected.to have_one_to_many(:napicer_skill) }
  end

  context 'validations' do
    specify { is_expected.to validate_presence(:name) }
  end
end
