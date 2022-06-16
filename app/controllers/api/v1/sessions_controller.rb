class Api::V1::SessionsController < Devise::SessionsController
  skip_before_action :authenticate_request, only: [:login]

  def create
    email = params[:user][:email]
    password = params[:user][:password]
    @user = User.find_by_email(email)

    if @user&.authenticate(password)
      token = jwt_encode(user_id: @user.id)
      render json: token, status: :ok
    else
      render json: { error: 'ivalid email or password' }, status: :unauthorized
    end
  end
end
