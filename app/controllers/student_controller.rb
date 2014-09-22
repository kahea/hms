class StudentController < ApplicationController
  def index
    @user = User.find(current_user.id)

    @programs_student = []
    @programs_assistant = []

    @user.program_users.each do |program_user| 
      if program_user.is_student?
        @programs_student.push program_user.program
      elsif program_user.is_assistant?
        @programs_assistant.push program_user.program
      end
    end

  end

  def submit
    # Still need validations, like student is in the section
    user = User.find(current_user.id)

    if !File.exists?("data/students/#{user.name}")
      Dir.mkdir "data/students/#{user.name}"
    end

    upload = params[:upload]
    
    
    section_assignment = SectionAssignment.find(params[:assignment_id])
    filename = "#{Time.new.to_i}_#{section_assignment.name}_#{upload.original_filename}"

    section_assignment_submission = user.section_assignment_submissions.new(
      section_assignment_id: section_assignment.id,
      filename: filename
    )
    section_assignment_submission.save

    File.open("data/students/#{user.name}/#{filename}", 'wb') do |f|
      f.write(upload.read)
      f.close
    end

    redirect_to student_path
  end

  def download
    submission = SectionAssignmentSubmission.find(params[:submission])
    send_file "data/students/#{submission.user.name}/#{submission.filename}"
  end

  def grade

    assignment = SectionAssignmentSubmission.find(params[:sectionAssignmentSubmissionId])
    @grade = assignment.section_assignment_submission_grades.new(
      user_id: current_user.id,
      quality: params[:quality],
      comments: params[:comments]
    )

    respond_to do |format|
      @grade.save
      format.js { render :template => 'student/js/grade.js.erb', layout: false }
    end

  end

  def view_comments

    @grade = SectionAssignmentSubmission.find(params[:submission]).section_assignment_submission_grades.first

    respond_to do |format|
      format.js { render template: 'student/js/view_comments.js.erb', layout: false }
    end

  end

end
