class Link < ActiveRecord::Base
  validates :title, :url, :user, presence: true

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user,
  class_name: :User

  has_many :comments,
  primary_key: :id,
  foreign_key: :link,
  class_name: :Comment
end
