class CreateProgramPermissions < ActiveRecord::Migration
  def change
    create_table :program_permissions do |t|
      t.belongs_to    :program_user
      t.string        :resource
      t.integer       :permission
      t.timestamps
    end
  end
end
