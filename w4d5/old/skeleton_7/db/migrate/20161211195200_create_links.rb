class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url, null: false
      t.string :title, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
