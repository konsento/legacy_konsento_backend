class Api::V1::VoteSerializer < Api::V1::BaseSerializer
  attributes :id, :user_id, :proposal_id, :opinion
end
