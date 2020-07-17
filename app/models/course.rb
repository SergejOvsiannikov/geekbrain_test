class Course < ApplicationRecord
  has_many :groups
  has_many :active_groups, -> { active }, class_name: 'Group'

  scope :w_closest_date, -> {
                               select("(array_agg(groups.start_date ORDER BY start_date ASC))[1]
                                        as nearest_start_date, courses.*").
                               left_joins(:groups).
                               where('groups.start_date > ? OR groups.id is NULL', Time.now).
                               group('courses.id')
                            }
  scope :order_by_closest_date, ->(order) { w_closest_date.order("nearest_start_date #{order}") }
end
