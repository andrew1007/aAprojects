class WatchList < ActiveRecord::Base

  has_many :watch_list_items,
  primary_key: :id,
  foreign_key: :watch_list_id,
  class_name: :WatchListItem

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

end
