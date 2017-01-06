class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest, unique: true
      t.string :username, unique: true
      t.string :session_token, unique: true
      t.timestamps null: false
    end
  end
end
