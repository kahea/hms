class AssignmentGrade < ActiveRecord::Base
  belongs_to    :assignment
  has_one       :student
end
