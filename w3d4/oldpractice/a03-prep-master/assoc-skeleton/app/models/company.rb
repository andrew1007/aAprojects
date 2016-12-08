# == Schema Information
#
# Table name: companies
#
#  id            :integer          not null, primary key
#  name          :string
#  website       :string
#  market_cap    :float
#  ticker_symbol :string
#  created_at    :datetime
#  updated_at    :datetime
#  exchange_id   :integer
#

class Company < ActiveRecord::Base

  belongs_to :exchange,
  primary_key: :id,
  foreign_key: :exchange_id,
  class_name: :Exchange

  has_many :board,
  primary_key: :id,
  foreign_key: :company_id,
  class_name: :Board

  has_many :prices,
  primary_key: :id,
  foreign_key: :company_id,
  class_name: :Price

  has_many :watch_list_item,
  primary_key: :id,
  foreign_key: :company_id,
  class_name: :WatchListItem



end
