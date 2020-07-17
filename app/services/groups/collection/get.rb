module Groups
  module Collection
    class Get
      def initialize(course_id:)
        @course = Course.find(course_id)
      end

      def call
        base_scope.ordered_by_date
      end

      private

      def base_scope
        @course.active_groups.w_students.w_course
      end
    end
  end
end
