class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, uniqueness: {scope: :user_id}


  has_many :contact_shares,
  primary_key: :id,
  foreign_key: :contact_id,
  class_name: :ContactShare

  belongs_to :owner,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :shared_users,
  through: :contact_shares,
  source: :user
end
