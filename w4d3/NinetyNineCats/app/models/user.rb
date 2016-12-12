class User < ActiveRecord::Base
  validates :user_name, :password_digest, presence: true
  after_initialize :ensure_session_token
  validates :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  # attr_reader :session_token

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def password
    @password
  end

  def reset_session_token!
    # debugger
    self.session_token = SecureRandom.urlsafe_base64(128)
    self.save!
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(128)
  end


  def is_password?(password)
    bc_object = BCrypt::Password.new(password_digest)
    bc_object.is_password?(password) #BCrypt method
  end


end
