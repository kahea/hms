class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.belongs_to  :section
      t.timestamps
    end
  end
end
