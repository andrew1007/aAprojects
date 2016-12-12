class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.string :user
      t.string :link
      t.timestamps null: false
    end
  end
end
