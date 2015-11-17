class Api::V1::RequirementValuesSerializer < Api::V1::BaseSerializer
  #just some basic attributes
  attributes :id, :user_id, :join_requirement_id, :value

end
