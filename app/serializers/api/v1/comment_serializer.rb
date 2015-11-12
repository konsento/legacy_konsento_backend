class Api::V1::CommentSerializer < Api::V1::BaseSerializer
  attributes :id, :user_id, :parent_id, :content, :commentable_id, :commentable_type
end
