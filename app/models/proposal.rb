class Proposal < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposal
  belongs_to :topic
  has_many :votes
  has_many :references
  has_and_belongs_to_many :comments
end
