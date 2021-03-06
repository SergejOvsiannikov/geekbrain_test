class Student < ApplicationRecord
  EMAIL_VALIDATION_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :students_groups, dependent: :destroy
  has_many :groups, through: :students_groups

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: EMAIL_VALIDATION_REGEXP }

  scope :w_groups_courses, -> { includes(groups: :course) }
end
