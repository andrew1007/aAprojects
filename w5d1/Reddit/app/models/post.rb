class Post < ActiveRecord::Base
validates :author, presence: true

  belongs_to :author,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :sub_ids,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :PostSub,
    inverse_of: :post

  has_many :subs,
    through: :sub_ids,
    source: :sub

end
