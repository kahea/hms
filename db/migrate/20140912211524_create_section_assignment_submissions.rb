class CreateSectionAssignmentSubmissions < ActiveRecord::Migration
  def change
    create_table :section_assignment_submissions do |t|
      t.belongs_to    :section_assignment
      t.belongs_to    :user
      t.string        :filename

      t.timestamps
    end
  end
end
