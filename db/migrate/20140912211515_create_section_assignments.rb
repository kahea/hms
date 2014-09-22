class CreateSectionAssignments < ActiveRecord::Migration
  def change
    create_table :section_assignments do |t|
      t.belongs_to    :section
      t.string        :name
      t.integer       :week
      t.string        :description
      t.datetime      :datetime_due
      t.datetime      :datetime_post_solutions
      t.timestamps
    end
  end
end
