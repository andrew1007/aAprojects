class User < ActiveRecord::Base

  validates :user_name, presence: true

  has_many :authored_polls,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Poll

  has_many :responses,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Response

end
