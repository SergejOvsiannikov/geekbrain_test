module Errors
  module ErrorHandler
    RESCUABLE_ERRORS = [
      ActiveRecord::RecordNotFound,
      ActiveRecord::RecordInvalid,
      ActiveRecord::RecordNotUnique
    ]

    def self.included(clazz)
      clazz.class_eval do
        rescue_from StandardError do |e|
          raise e
          # render file: 'public/500.html', layout: false
        end

        rescue_from *RESCUABLE_ERRORS do |e|
          respond(e.message)
        end
      end
    end

    private

    def respond(message)
      flash[:danger] = message

      path = request.referrer.present? ? request.referrer : courses_path

      redirect_to path
    end
  end
end
