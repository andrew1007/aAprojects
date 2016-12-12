class ContactShare < ActiveRecord::Base
  validates :user_id, :contact_id, presence: true

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :contact,
  primary_key: :id,
  foreign_key: :contact_id,
  class_name: :Contact

end
