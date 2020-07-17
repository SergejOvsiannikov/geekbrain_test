require 'rails_helper'

describe Student, type: :model do
  it { is_expected.to have_many(:students_groups) }
end
