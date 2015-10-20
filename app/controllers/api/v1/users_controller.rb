class Api::V1::UsersController < Api::V1::BaseController
  before_filter :authenticate_user!, only: [:show, :update]

  def show
    user = User.find(params[:id])
    render( json: user, serializer: Api::V1::UserSerializer)
  end
end
