class Api::V1::PostsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.posts
  end
end
