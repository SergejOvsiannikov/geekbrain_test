module Courses
  module Collection
    class Get
      def initialize(sort_params)
        @start_date_order = sort_params&.dig('nearest_lesson') || 'ASC'
      end

      def call
        collection = base_scope

        if @start_date_order.present?
          collection = collection.order_by_closest_date(@start_date_order)
        end

        collection
      end

      private

      def base_scope
        Course.all
      end
    end
  end
end
