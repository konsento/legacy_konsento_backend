class Api::V1::InvitationsController < Api::V1::BaseController
  before_filter :authenticate_user!, only: [:create]

  def create
    puts has_available_invites?
    if has_available_invites?
      invitation = Invitation.new
      invitation.email = create_params[:email]
      invitation.token = generate_token
      invitation.user = @current_user
      if invitation.save
        @current_user.decrement!(:available_invitations, by = 1)
        render( json: invitation, serializer: Api::V1::InvitationSerializer)
      end
    else
      render json: { error: 'no available invites' }, status: 401
    end
  end

  private
  def generate_token
    token = nil
    loop do
      token = SecureRandom.urlsafe_base64(nil, false)
      break unless Invitation.find_by(token: token)
    end
    token
  end

  def has_available_invites?
    @current_user.available_invitations > 0
  end

  def create_params
    params.permit(:email)
  end
end
