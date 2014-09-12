class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.belongs_to  :program, null: false
      t.string      :name, null: false
      t.timestamps
    end
  end
end
