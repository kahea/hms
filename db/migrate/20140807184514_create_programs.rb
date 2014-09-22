class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string      :name, unique: true, null: false
      t.timestamps
    end
  end
end
