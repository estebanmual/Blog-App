class Api::V1::CommentsController < ApplicationController
  include JsonWebToken
  skip_before_action :authenticate_request

  def index
    user_id = params[:user_id]
    post_id = params[:post_id]

    if !user_id || !post_id
      render json: { error: 'Invalid parameters' }, status: 400
      return
    end

    token = User.find(user_id).token
    credential = JsonWebToken::EncoderJWT.jwt_decode(token)
    if authenticate_request(credential)
      comments = Comment.where(post_id: post_id)
      render json: comments, status: :ok
    else
      render json: { error: 'unauthorized' }, status: 401
    end
  end

  def create
    user_id = params[:user_id]
    token = User.find(user_id).token
    credential = JsonWebToken::EncoderJWT.jwt_decode(token)
    if authenticate_request(credential)
      comment = Comment.new(comment_params)
      render json: { message: 'your comment was created succesfully'}, status: :ok
    else
      render json: { error: 'unauthorized' }, status: 401
    end
  end

  private

  def comments_params
    defaults = { post_id: params[:post_id], user_id: params[:user_id]}
    params.require(:comment).permit(:Text, :post_id, :user_id).reverse_merge(defaults)
  end
end
