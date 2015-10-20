class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  has_many :subscriptions
  has_many :votes
  has_many :comments
  has_many :proposals
  has_many :requirement_values
  has_many :topics

  before_create :generate_authentication_token

  def generate_authentication_token
    loop do
      self.authentication_token = SecureRandom.base64(64)
      break unless User.find_by(authentication_token: authentication_token)
    end
  end

  def password
      password ||= Password.new(encrypted_password)
  end

  def password=(new_password)
    password = Password.create(new_password)
    self.encrypted_password = password
  end

  def authenticate(password)
    self.password == password
  end
end
