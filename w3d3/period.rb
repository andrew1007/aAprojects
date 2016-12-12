class Period < ActiveRecord::Base

  has_many :periods,
  primary_key: :id,
  foreign_key: :period_id,
  class_name: :Course


end
