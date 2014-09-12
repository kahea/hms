class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many  :programs
  has_many  :assignments
  has_many  :student_assignments

  def is_admin?
    return self.role == 'admin'
  end

  def is_instructor?
    return self.role == 'instructor'
  end

  def is_student?
    return self.role == 'student'
  end

  def is_grader?
    return self.role == 'grader'
  end

  def set_instructor_role!
    self.update_attribute :role, :instructor
  end

  def set_student_role!
    self.update_attribute :role, :student
  end

  def set_grader_role!
    self.update_attribute :role, :grader
  end
  
end
