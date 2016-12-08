class ChangeContactUniqueness < ActiveRecord::Migration
  def change
    change_column :contact_shares, :contact_id, :integer, unique: false
    change_column :contact_shares, :user_id, :integer, unique: false
  end
end
