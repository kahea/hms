class SectionAssignmentSubmissionGrade < ActiveRecord::Base
  belongs_to  :section_assignment_submission
  belongs_to  :user
end
