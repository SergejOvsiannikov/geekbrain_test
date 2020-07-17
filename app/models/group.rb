class Group < ApplicationRecord
  has_many :students_groups, dependent: :destroy
  has_many :students, through: :students_groups

  belongs_to :course

  scope :active, -> { where('start_date > ?', Time.now) }
  scope :ordered_by_date, -> { order(start_date: :asc) }
  scope :w_course, -> { includes(:course) }
end
