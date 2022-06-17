class Api::V1::PostsController < ApplicationController
  include JsonWebToken
  skip_before_action :authenticate_request

  def index
    user_id = params[:user_id]
    if !user_id
      render json: { error: 'Invalid parameters' }, status: 400
      return
    end
    token = User.find(user_id).token
    credential = JsonWebToken::EncoderJWT.jwt_decode(token)
    if authenticate_request(credential)
      posts = Post.where(user_id: user_id)
      render json: posts, status: :ok
    else
      render json: { error: 'unauthorized' }, status: 401
    end
  end
end
