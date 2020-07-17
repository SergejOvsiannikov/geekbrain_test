# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'ffaker'

StudentsGroup.delete_all
Student.delete_all
Group.delete_all
Course.delete_all

5.times.each do |index|
  course = Course.create(name: "#{FFaker::Skill.specialty} course")

  3.times.each do |group_index|
    rand_val = rand(1..400)
    course.groups.create(start_date: (group_index.days.from_now + rand_val.minutes))
  end
end
