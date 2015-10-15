class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :username, :email

  has_many :subscriptions
  has_many :votes
  has_many :comments
  has_many :proposals
  has_many :requirement_values
  has_many :topics
end
