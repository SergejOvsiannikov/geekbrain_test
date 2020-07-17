module Courses
  module Groups
    module Students
      class Registration
        def initialize(group_id:, course_id:)
          course = Course.find(course_id)
          @group = course.groups.find(group_id)
        end

        def call(student_email)
          student = Student.find_or_create_by!(email: student_email)

          @group.students << student
        end
      end
    end
  end
end
