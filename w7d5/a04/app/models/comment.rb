class Comment < ActiveRecord::Base
  validates :body, :user, :link, presence: true
  belongs_to :user
  belongs_to :link
end
