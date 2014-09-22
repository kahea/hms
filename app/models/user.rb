class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:admin, :instructor, :student]

  has_many  :program_users
  has_many  :programs, through: :program_users
  has_many  :section_assignment_submissions

  def is_admin?
    return self.role == :admin
  end

  def is_instructor?
    return self.role == "instructor"
  end

  def is_student?
    return self.role == "student"
  end

  def set_instructor_role
    self.update_attribute :role, :instructor
  end

  def set_student_role
    self.update_attribute :role, :student
  end
  
end
