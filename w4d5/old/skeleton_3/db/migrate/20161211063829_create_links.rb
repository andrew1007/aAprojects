class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.timestamps null: false
    end
  end
end
