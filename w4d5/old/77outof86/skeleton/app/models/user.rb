class User < ActiveRecord::Base
  validates :password_digest, :username, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token!
  attr_reader :password
  has_many :links,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Link

  has_many :comments,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :Comment

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    return nil if !user.valid_password?(password)
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    pass_check = BCrypt::Password.new(self.password_digest)
    pass_check.is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def ensure_session_token!
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
