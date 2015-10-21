class Api::V1::SessionsController < Api::V1::BaseController
  #login
  def create
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      self.current_user = user
      render(
        json: Api::V1::SessionSerializer.new(user, root: false).to_json,
        status: 201
      )
    else
      return api_error(status: 401)
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
