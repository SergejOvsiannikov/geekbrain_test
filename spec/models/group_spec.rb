require 'rails_helper'

describe Group, type: :model do
  it { is_expected.to have_many(:students_groups) }
  it { is_expected.to have_many(:students) }
  it { is_expected.to belong_to(:course) }
end
