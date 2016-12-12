class User < ActiveRecord::Base
  validates :username, :password_digest, presence: true
  validates :password, length: {minimum:6, allow_nil: true}
  after_initialize :ensure_session_token
  attr_reader :password
  has_many :links
  has_many :comments


  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.valid_password?(password)
    user
  end

  def password=(password)
    @password = password
    pass_dig = BCrypt::Password.create(password)
    self.password_digest = pass_dig
  end

  def valid_password?(password)
    pass_test = BCrypt::Password.new(self.password_digest)
    pass_test.is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
