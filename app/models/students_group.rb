class StudentsGroup < ApplicationRecord
  belongs_to :student
  belongs_to :group, counter_cache: :students_count
end
