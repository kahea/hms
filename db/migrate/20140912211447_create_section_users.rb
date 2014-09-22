class CreateSectionUsers < ActiveRecord::Migration
  def change
    create_table :section_users do |t|
      t.belongs_to  :section
      t.belongs_to  :user
      t.integer     :role
      t.timestamps
    end
  end
end
