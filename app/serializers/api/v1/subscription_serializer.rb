class Api::V1::SubscriptionSerializer < Api::V1::BaseSerializer
  attributes :id, :user_id, :group_id, :role
end
