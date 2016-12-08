class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.text :address
      t.integer :people_id
      t.timestamps null: false
    end
  end
end
