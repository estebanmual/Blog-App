class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_to user_post_path(params[:user_id], params[:post_id]), notice: 'Your comment has been created successfully'
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(user_id: @comment.user_id, id: @comment.post_id),
                notice: 'Your comment has been deleted successfully'
  end

  private

  def comment_params
    defaults = { post_id: params[:post_id] }
    params.require(:comment).permit(:Text, :post_id).reverse_merge(defaults)
  end
end
