class Api::V1::RequirementValuesController < Api::V1::BaseController
  def create
    requirement_value = RequirementValue.new
    requirement_value.user = User.find(requirement_values_params[:user_id])
    requirement_value.join_requirement = JoinRequirement.find(requirement_values_params[:join_requirement_id])
    requirement_value.value = requirement_values_params[:value]
    if requirement_value.save
          render( json: requirement_value, serializer:  Api::V1::RequirementValuesSerializer)
    else
        return api_error(status: 401, errors: requirement_value.errors)
    end
  end

  private
  def requirement_values_params
    params.require(:requirement_value).permit(:user_id, :join_requirement_id, :value)
  end
end
