class Api::V1::CommentsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    post = user.posts.find(params[:post_id])

    render json: post.comments
  end

  def create
    comment = current_user.comments.new(comment_params)

    render json: comment if comment.save
  end

  private

  def comments_params
    defaults = { post_id: params[:post_id] }
    params.require(:comment).permit(:Text, :post_id).reverse_merge(defaults)
  end
end
