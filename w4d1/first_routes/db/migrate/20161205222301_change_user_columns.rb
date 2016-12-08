class ChangeUserColumns < ActiveRecord::Migration
  def change
    remove_column :users, :email, :string
    remove_column :users, :name, :string
  end
end
