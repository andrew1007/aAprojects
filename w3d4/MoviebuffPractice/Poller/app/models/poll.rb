class Poll < ActiveRecord::Base

  belongs_to :author,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :polls,
  primary_key: :id,
  foreign_key: :poll_id,
  class_name: :Question

end
