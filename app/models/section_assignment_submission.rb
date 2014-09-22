class SectionAssignmentSubmission < ActiveRecord::Base
  belongs_to  :section_assignment
  belongs_to  :user
  has_many    :section_assignment_submission_grades
end
