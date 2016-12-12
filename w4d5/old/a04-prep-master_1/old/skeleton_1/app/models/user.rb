class User < ActiveRecord::Base
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token

  attr_reader :password

  has_many :links,
  primary_key: :id,
  foreign_key: :user,
  class_name: :Link

  has_many :comments,
  primary_key: :id,
  foreign_key: :user,
  class_name: :Comment

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user && user.valid_password?(password)
    user
  end

  def password=(password)
    pass = BCrypt::Password.create(password)
    self.password_digest = pass
    @password = password
  end


  def valid_password?(password)
    test_pass = BCrypt::Password.new(password_digest)
    test_pass.is_password?(password)
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
