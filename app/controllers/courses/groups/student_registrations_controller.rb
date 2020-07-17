class Courses::Groups::StudentRegistrationsController < ApplicationController
  def create
    Courses::Groups::Students::Registration.new(**common_params).call(student_params[:email])

    flash[:success] = "You successfully assigned to group!"
    redirect_to courses_path
  end

  private

  def common_params
    params.permit(:group_id, :course_id).to_h.symbolize_keys
  end

  def student_params
    params.require(:student).permit(:email)
  end
end
