class Api::V1::InvitationSerializer < Api::V1::BaseSerializer
  #just some basic attributes
  attributes :email, :token, :registered
end
