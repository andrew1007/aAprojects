class Link < ActiveRecord::Base
  validates :title, :user, :url, presence: true

  has_many :comments
  belongs_to :user
end
