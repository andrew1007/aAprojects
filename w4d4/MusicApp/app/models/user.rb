require 'bcrypt'
class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true, uniqueness: true
  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(email, password)
    user = self.find_by(email: email)
    user.is_password?(password) ? user : nil
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(10)
    self.save!
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(10)
  end

  def password=(password)
    # debugger
    d_crypted = BCrypt::Password.create(password)
    self.password_digest = d_crypted
    @password = password
  end

  def is_password?(password)
    bc_test = BCrypt::Password.new(password_digest)
    bc_test.is_password?(password)
  end
end
