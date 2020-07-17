class Group < ApplicationRecord
  has_many :students_group, dependent: :destroy
  has_many :students, through: :students_group

  belongs_to :course

  scope :active, -> { where('start_date > ?', Time.now) }
  scope :ordered_by_date, -> { order(start_date: :asc) }
end
