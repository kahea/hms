class ProgramsController < ApplicationController

  def create
    @program = Program.new(:name => params[:name], :instructor_id => current_user.id)

    respond_to do |format|
      if @program.save
        # format.html { redirect_to '/'}
        # format.js { redirect_to '/'}
        format.js
      else
        # format.html { redirect_to '/'}
      end
    end

  end

end
