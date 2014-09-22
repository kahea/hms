class ProgramUser < ActiveRecord::Base
  belongs_to    :program
  belongs_to    :user
  has_many      :program_permissions

  enum role: [:admin, :instructor, :assistant, :student]

  def is_student?
    return self.role == "student"
  end

  def is_assistant?
    return self.role == "assistant"
  end

  def set_instructor_role
    self.update_attribute :role, :instructor
  end

  def set_student_role
    self.update_attribute :role, :student
  end

  def set_assistant_role
    self.update_attribute :role, :assistant
  end

end
