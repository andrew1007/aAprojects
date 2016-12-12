class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, unique: true
      t.string :email, unique: true
      t.integer :user_id, unique: true
      t.timestamps null: false
    end
    add_index :contacts, :user_id, unique: true
  end
end
