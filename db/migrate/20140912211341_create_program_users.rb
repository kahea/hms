class CreateProgramUsers < ActiveRecord::Migration
  def change
    create_table :program_users do |t|
      t.belongs_to      :program
      t.belongs_to      :user
      t.integer         :role
      t.timestamps
    end
  end
end
