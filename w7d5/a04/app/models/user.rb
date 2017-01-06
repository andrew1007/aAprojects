class User < ActiveRecord::Base
  validates :password_digest, :username, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  attr_reader :password
  after_initialize :ensure_session_token

  has_many :links
  has_many :comments
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.valid_password?(password)
    user
  end

  def password=(password)
    @password = password
    digest = BCrypt::Password.create(password)
    self.password_digest = digest
  end

  def valid_password?(password)
    digested = BCrypt::Password.new(self.password_digest)
    digested.is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
