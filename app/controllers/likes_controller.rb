class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = current_user.likes.new(likes_params)
    @like.save
    redirect_to user_post_path(@like.user_id, @like.post_id), notice:'Your like has been created successfully'
  end

  private

  def likes_params
    defaults = { post_id: params[:post_id] }
    params.permit(:post_id).reverse_merge(defaults)
  end
end
