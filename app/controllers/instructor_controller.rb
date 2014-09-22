class InstructorController < ApplicationController

  def index
    @user = User.find(current_user.id)
    @programs = @user.programs
  end

  # Programs
  def program_create
    @program = Program.new(:name => params[:programName])
    if @program.save
      program_user = @program.program_users.new(user_id: current_user.id, role: 1)
      program_user.save
    end

    respond_to do |format|
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

  def program_user_student_create
    user = User.find(current_user.id)
    if program = user.programs.find(params[:programId])
      if user_student = User.find_by(name: params[:id])
        @program_user = program.program_users.new(user_id: user_student.id)
        @program_user.set_student_role
        @program_user.save
      end
    end

    respond_to do |format|
      if !@program_user
        @err = "Student not found"
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

  def program_user_assistant_create
    user = User.find(current_user.id)
    if program = user.programs.find(params[:programId])
      if user_student = User.find_by(name: params[:id])
        @program_user = program.program_users.new(user_id: user_student.id)
        @program_user.set_assistant_role
        @program_user.save
      end
    end

    respond_to do |format|
      if !@program_user
        @err = "Student not found"
      end
      format.js { render 'instructor/js/program_user_assistant_create.js.erb', :layout => false }
    end
  end

  # Sections
  def section_create
    user = User.find(current_user.id)
    program = user.programs.find(params[:programId])
    @section = program.sections.new(name: params[:sectionName])
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

  # Section Assignments
  def section_assignment_create

    section = Section.find(params[:sectionId])

    @section_assignment = section.section_assignments.new(
      week: params[:week],
      name: params[:name],
      description: params[:description],
      datetime_due: Date.strptime(params[:dueDatePicker], "%m/%d/%Y"),
    )

    respond_to do |format|
      @section_assignment.save
      @cnt = section.section_assignments.all.size + 1
      format.js { render 'instructor/js/assignment_create.js.erb', :layout => false }
    end
  end

  def section_assignment_destroy
    @section_assignment = SectionAssignment.find(params[:section_assignment])
    respond_to do |format|
      @section_assignment.destroy
      format.js { render 'instructor/js/section_assignment_destroy.js.erb', :layout => false }
    end
  end

end
