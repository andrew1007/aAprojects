class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :user_visits,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Visit

  has_many :visited_urls,
  through: :user_visits,
  source: :visited_url

  def retrieve_long_url(short_url)
    user_link = shortened_urls.where(short_url: short_url).pluck(:long_url).first
  end

  has_many :shortened_urls,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :ShortenedUrl
end
