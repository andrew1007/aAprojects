class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :long_url, :user_id, presence: true
  validates :long_url, uniqueness: true

  def self.create_for_user_and_long_url!(user, long_url)
    user = User.create(email: user)
    ShortenedUrl.create(long_url: long_url, short_url: ShortenedUrl.random_code, user_id: user.id )
  end

  def self.random_code
    code = SecureRandom::urlsafe_base64
    until !ShortenedUrl.exists?(short_url: code)
      code = SecureRandom::urlsafe_base64
    end
    code
  end

  def click_count
    Visit.where(shortened_url_id: self.id).count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques(time)
    visitors.where(created_at < time).count
  end

  has_many :visits,
  primary_key: :id,
  foreign_key: :shortened_url_id,
  class_name: :Visit

  has_many :visitors,
  Proc.new { distinct },
  through: :visits,
  source: :visitor

end
