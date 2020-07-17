module Groups
  module Collection
    class Get
      def initialize(course_id:)
        @course = Course.find(course_id)
      end

      def call
        base_scope.w_course.ordered_by_date
      end

      private

      def base_scope
        @course.active_groups
      end
    end
  end
end
