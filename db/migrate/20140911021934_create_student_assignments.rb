class CreateStudentAssignments < ActiveRecord::Migration
  def change
    create_table :student_assignments do |t|
      t.belongs_to    :user
      t.belongs_to    :assignment
      t.string        :filename
      t.timestamps
    end
  end
end
