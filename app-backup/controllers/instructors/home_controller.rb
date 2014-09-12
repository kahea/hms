class Instructors::HomeController < ApplicationController
  
  def index
    @user = User.find(current_user.id)
    @programs = @user.programs
  end

end
