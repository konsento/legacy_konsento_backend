class Api::V1::TopicSerializer < Api::V1::BaseSerializer
  attributes :id, :user_id, :group_id, :parent_id, :title

  has_many :proposals
end
