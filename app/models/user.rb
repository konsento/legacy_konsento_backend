class User < ActiveRecord::Base
  include BCrypt
  has_secure_password
  has_many :subscriptions
  has_many :votes
  has_many :comments
  has_many :proposals
  has_many :requirement_values
  has_many :topics

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
