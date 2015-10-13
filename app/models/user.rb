class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :votes
  has_many :comments
  has_many :proposals
  has_many :requirement_values
  has_many :topics
end
