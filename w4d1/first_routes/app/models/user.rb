class User < ActiveRecord::Base
  validates :username, presence: true

  has_many :contact_shares,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :ContactShare

  has_many :user_contacts,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Contact

  has_many :shared_contacts,
  through: :contact_shares,
  source: :user
end
