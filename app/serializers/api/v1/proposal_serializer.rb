class Api::V1::ProposalSerializer < Api::V1::BaseSerializer
  attributes :id, :user_id, :parent_id, :topic_id, :content

end
