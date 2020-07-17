class ApplicationController < ActionController::Base
  include Errors::ErrorHandler

  protect_from_forgery with: :exception
end
