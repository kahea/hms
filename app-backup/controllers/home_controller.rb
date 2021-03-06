class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      user = User.find(current_user.id)
      if user.is_admin?
        # redirect_to '/admin/index'
        render '/admin/home'
      elsif user.is_instructor?
        # redirect_to '/instructor/index'
        redirect_to instructors_home_index_path
      end
    end
  end

end
