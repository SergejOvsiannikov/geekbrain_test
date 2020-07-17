require 'rails_helper'

describe StudentsGroup, type: :model do
  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:group) }
end
