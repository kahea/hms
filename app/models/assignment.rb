class Assignment < ActiveRecord::Base
  belongs_to  :section
  has_many    :student_assignments
end
