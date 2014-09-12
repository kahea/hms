class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.belongs_to  :user, null: false
      t.string      :name, unique: true, null: false
      t.timestamps
    end
  end
end
