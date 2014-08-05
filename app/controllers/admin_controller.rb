class AdminController < ApplicationController
  before_action :authenticate_admin

  def index
    @instructors = User.where :role => "instructor"
  end

  def instructor_add
    puts "\nemail:#{params[:email]}"

    if user = User.where(:email => params[:email]).first and !user.is_admin?
      user.set_instructor_role! 
    else
      flash[:add_message] = "User not found"
    end

    redirect_to admin_index_path
  end

  def instructor_delete
    email = params[:email]
    if user = User.where(:email => email).first and !user.is_admin?
      user.set_student_role!
    end

    redirect_to admin_index_path
  end

end
