class SectionAssignment < ActiveRecord::Base
  belongs_to  :section
  has_many    :section_assignment_submissions
end
