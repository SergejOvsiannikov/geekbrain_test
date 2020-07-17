class CoursesController < ApplicationController
  def index
    @courses = Courses::Collection::Get.new(params[:sort]).call
  end

  def show
    @groups = Groups::Collection::Get.new(course_id: params[:id]).call
  end
end
