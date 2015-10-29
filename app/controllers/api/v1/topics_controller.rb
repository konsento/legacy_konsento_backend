class Api::V1::TopicsController < Api::V1::BaseController
  before_filter :authenticate_user!, only: [:create]

  def create
    topic = Topic.new
    topic.user = @current_user
    topic.group = Group.find(topic_params[:group_id])
    topic.title = topic_params[:title]
    topic.parent_id = topic_params[:parent_id]
    topic.save
    if topic.persisted?
      render( json: topic, serializer: Api::V1::TopicSerializer)
    else
      return api_error(status: 401, errors: topic.errors)
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:group_id, :parent_id, :title)
  end
end
