require 'rails_helper'

describe Course, type: :model do
  it { is_expected.to have_many(:groups) }
  it { is_expected.to have_many(:active_groups) }
end
