class Api::V1::ProposalsController < Api::V1::BaseController
  before_filter :authenticate_user!, only: [:create]

  def create
    proposal = Proposal.new
    proposal.user = @current_user
    proposal.parent_id = proposal_params[:parent_id]
    proposal.topic = Topic.find(proposal_params[:topic_id])
    proposal.content = proposal_params[:content]
    proposal.save
    if proposal.persisted?
        render( json: proposal, serializer: Api::V1::ProposalSerializer)
    else
      return api_error(status: 401)
    end
  end

  private
  def proposal_params
    params.require(:proposal).permit(:parent_id, :topic_id, :content)
  end
end
