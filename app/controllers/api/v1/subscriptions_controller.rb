class Api::V1::SubscriptionsController < Api::V1::BaseController
  before_filter :authenticate_user!, only: [:create, :unsubscribe]

  def create
    group = Group.find(group_params[:id])
    if user_has_join_requirements?(group)
      subscription = Subscription.create(user: @current_user, group: group, role: "default")
      if subscription.persisted?
        render( json: subscription, serializer: Api::V1::SubscriptionSerializer)
      else
        return api_error(status: 401, errors: subscription.errors)
      end
    else
      render json: {error: "missing join requirements"}, status: 401
    end
  end

  def unsubscribe
    subscription = Subscription.find_by(user: @current_user, group: group_params[:id])
    if subscription.destroy
      head status:200
    else
      return api_error(status: 401, errors: subscription.errors)
    end
  end

  private
  def group_params
    params.require(:group).permit(:id)
  end

  def user_has_join_requirements?(group)
    join_requirements = group.join_requirements
    status = true
    join_requirements.each do |j|
      status = RequirementValue.find_by(user: @current_user, join_requirement: j) && status
    end
    status
  end
end
