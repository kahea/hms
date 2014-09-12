class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      user = User.find(current_user.id)
      if user.is_admin?
        render '/admin/home'
      elsif user.is_instructor?
        redirect_to instructor_path
      elsif user.is_student?
        redirect_to student_path
      elsif user.is_grader?
        redirect_to grader_path
      end
    end
  end

end
