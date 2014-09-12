class StudentController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @programs= []
    ProgramUser.where(:user_id => @user.id).each do |program_user|
      @programs.push program_user.program
    end
  end


  def submit
    # Still need validations, like student is in the section

    upload = params[:upload]
    assignment_id = params[:assignment_id]
    filename = "#{Time.new.to_i}_#{upload.original_filename}"
    user = User.find(current_user.id)
    sa = user.student_assignments.new(assignment_id: assignment_id, filename: filename)

    if !File.exists?("data/students/#{user.id}")
      Dir.mkdir "data/students/#{user.id}"
    end

    if !File.exists?("data/students/#{user.id}/#{assignment_id}")
      Dir.mkdir "data/students/#{user.id}/#{assignment_id}"
    end

    File.open("data/students/#{user.id}/#{assignment_id}/#{filename}", 'wb') do |f|
      f.write(upload.read)
      f.close
    end

    sa.save
    redirect_to student_path
  end

end
