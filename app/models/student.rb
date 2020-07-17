class Student < ApplicationRecord
  EMAIL_VALIDATION_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :students_group, dependent: :destroy

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: EMAIL_VALIDATION_REGEXP }
end
