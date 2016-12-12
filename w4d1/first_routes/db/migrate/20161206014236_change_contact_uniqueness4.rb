class ChangeContactUniqueness4 < ActiveRecord::Migration
  def change
    remove_index :contact_shares, :contact_id
    add_index :contact_shares, :contact_id
    remove_index :contact_shares, :user_id
    add_index :contact_shares, :user_id
  end
end
