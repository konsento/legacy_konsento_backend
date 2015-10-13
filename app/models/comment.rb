class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  has_and_belongs_to_many :proposals
  has_and_belongs_to_many :topics
end
