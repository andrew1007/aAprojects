class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.string :title, null: false
      t.integer :user_id, null: false
      t.integer :link_id, null: false
      t.timestamps null: false
    end
    # add_index :comments, :user_id, :link_id
  end
end
