class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin
    if user_signed_in?
      @user = User.find(current_user.id)
      if @user.is_admin?
        return
      end
    end
    redirect_to '/'
  end

  def authenticate_instructor
    if user_signed_in?
      @user = User.find(current_user.id)
      if @user.is_instructor?
        return
      end
    end
    redirect_to '/'
  end

  def authenticate_admin_or_instructor
    if user_signed_in?
      @user = User.find(current_user.id)
      if @user.is_admin? || @user.is_instructor?
        return
      end
    end
    redirect_to '/'
  end

  def authenticate_student
    if user_signed_in?
      @user = User.find(current_user.id)
      if @user.is_student?
        return
      end
    end
    redirect_to '/'
  end
  
end
