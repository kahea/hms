class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to  :section
      t.belongs_to  :user

      t.integer     :week
      t.string      :thetype
      t.string      :topic
      t.string      :directions
      t.string      :readings
      t.string      :resources
      t.string      :files
      t.string      :solutions

      t.date        :date_due
      t.date        :date_solutions_post

      t.timestamps
    end
  end
end
