class InstructorController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @programs = @user.programs
  end

  def program_create
    @program = Program.new(:name => params[:programName], :user_id => current_user.id)
    respond_to do |format|
      @program.save
      format.js { render :template => 'instructor/js/program_create.js.erb', :layout => false }
    end
  end

  def program_destroy
    @program = Program.find(params[:program])
    respond_to do |format|
      @program.destroy
      format.js { render :template => 'instructor/js/program_destroy.js.erb', :layout => false }
    end
  end

  def section_create
    @program = Program.where(:id => params[:programId], :user_id => current_user.id).first
    @section = @program.sections.new(:name => params[:sectionName])
    respond_to do |format|
      @section.save
      format.js { render 'instructor/js/section_create.js.erb', :layout => false }
    end
  end

  def section_destroy
    @section = Section.find(params[:section])
    respond_to do |format|
      @section.destroy
      format.js { render 'instructor/js/section_destroy.js.erb', :layout => false }
    end
  end

  def program_user_create
    # do not allow instructor accounts here

    @program = Program.where(:id => params[:programId], :user_id => current_user.id).first
    if user = User.find_by(:email => params[:userEmail])
      @program_user = @program.program_users.new(:user_id => user.id)
    else
      @err = "User does not exist"
    end
    respond_to do |format|
      if !@err
        @program_user.save
      end
      format.js { render 'instructor/js/program_user_create.js.erb', :layout => false }
    end
  end

  def program_user_destroy
    @program_user = ProgramUser.find(params[:program_user])
    respond_to do |format|
      @program_user.destroy
      format.js { render 'instructor/js/program_user_destroy.js.erb', :layout => false }
    end
  end

  def assignment_create
    section = Section.find(params[:sectionId])
    if current_user.id != section.program.user_id
      return
    end

    assignment = section.assignments.new(
      :user_id => current_user.id,
      :thetype => params[:type],
      :topic => params[:topic],
      :directions => params[:directions],
      :readings => params[:readings],
      :resources => params[:resources],
      :files => params[:files],
      :solutions => params[:solutions],
      :date_due => Date.strptime(params[:dueDatePicker], "%m/%d/%Y"),
      :date_solutions_post => Date.strptime(params[:solutionsDatePicker], "%m/%d/%Y")
    )

    respond_to do |format|
      section.save
      format.js { render 'instructor/js/assignment_create.js.erb', :layout => false }
    end
  end

end
