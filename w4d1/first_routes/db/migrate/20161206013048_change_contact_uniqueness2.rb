class ChangeContactUniqueness2 < ActiveRecord::Migration
  def change
    rename_index :contact_shares, "index_contact_shares_on_contact_id", "index_contact_shares_on_contact_id", :unique => false
    rename_index :contact_shares, "index_contact_shares_on_user_id", "index_contact_shares_on_user_id", :unique => false
  end
end
