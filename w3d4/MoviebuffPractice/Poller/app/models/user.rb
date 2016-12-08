class User < ActiveRecord::Base

  has_many :polls,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Poll

  has_many :responses,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Response

  has_many :authored_polls
  through: :polls,
  source: :user_name


end
