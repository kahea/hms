class CreateSectionPermissions < ActiveRecord::Migration
  def change
    create_table :section_permissions do |t|
      t.belongs_to    :section_user
      t.string        :resource
      t.integer       :permission
      t.timestamps
    end
  end
end
