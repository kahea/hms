class CreateProgramUsers < ActiveRecord::Migration
  def change
    create_table :program_users do |t|
      t.belongs_to    :program, null: false
      t.belongs_to    :user, null: false
      t.timestamps
    end
  end
end
