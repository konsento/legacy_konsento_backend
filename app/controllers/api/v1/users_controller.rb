class Api::V1::UsersController < Api::V1::BaseController
  before_filter :authenticate_user!, only: [:show, :update]

  def show
    user = User.find(params[:id])
    render( json: user, serializer: Api::V1::UserSerializer)
  end

  def create
    invitation = Invitation.find_by(token: invitation_params[:token])
    if invitation && !invitation.registered
      user = User.create(email: invitation.email, username: user_params[:username], password: user_params[:password])
      if user.persisted?
        invitation.update(registered: true)
        render( json: user, serializer: Api::V1::UserSerializer)
      end
    else
      render json: { error: 'invalid invitation' }, status: 400
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
  def invitation_params
    params.require(:invitation).permit(:token)
  end
end
