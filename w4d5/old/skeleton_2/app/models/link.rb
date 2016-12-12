class Link < ActiveRecord::Base
  validates :title, :url, :user, presence: true

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :comments,
  primary_key: :id,
  foreign_key: :link_id,
  class_name: :Comment
end
