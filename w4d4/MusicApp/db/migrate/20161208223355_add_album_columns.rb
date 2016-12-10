class AddAlbumColumns < ActiveRecord::Migration
  def change
    add_column :albums, :year, :integer
    add_column :albums, :type, :string
  end
end
