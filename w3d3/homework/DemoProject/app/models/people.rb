class People < ActiveRecord::Base
  validates :name, :presence => true

  belongs_to :house, {
    :class_name => "House",
    :foreign_key => :house_id,
    :primary_key => :id
  }
end
#Houses with People such that Houses can have many Residents and each Person belongs to a House.
