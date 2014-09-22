class CreateSectionAssignmentSubmissionGrades < ActiveRecord::Migration
  def change
    create_table :section_assignment_submission_grades do |t|
      t.belongs_to  :section_assignment_submission
      t.belongs_to  :user
      t.string      :comments
      t.string      :quality
      t.timestamps
    end
  end
end
