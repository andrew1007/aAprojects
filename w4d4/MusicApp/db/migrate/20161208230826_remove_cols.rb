class RemoveCols < ActiveRecord::Migration
  def change
    add_column :albums, :style, :string
    remove_column :albums, :type
  end
end
