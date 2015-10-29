class Api::V1::VotesController < Api::V1::BaseController
  before_filter :authenticate_user!, only: [:create]

  def create
    vote = Vote.find_or_initialize_by(user: @current_user, proposal_id: vote_params[:proposal_id])
    vote.update(opinion: vote_params[:opinion])
    if vote.valid?
      render( json: vote, serializer: Api::V1::VoteSerializer)
    else
      return api_error(status: 401)
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:proposal_id, :opinion)
  end
end
