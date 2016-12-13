class PostSub < ActiveRecord::Base
  # validates :post_id, uniqueness: {scope: :sub_id}
  validates :post, :sub, presence: true

  belongs_to :post,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Post

  belongs_to :sub,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :Sub

end
