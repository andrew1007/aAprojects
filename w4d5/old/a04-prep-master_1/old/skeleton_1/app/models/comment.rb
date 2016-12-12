class Comment < ActiveRecord::Base
  validates :body, :user, :link, presence: true

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user,
  class_name: :User

  belongs_to :link,
  primary_key: :id,
  foreign_key: :link,
  class_name: :Link

end
