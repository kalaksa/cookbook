class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.recipe_id = params[:recipe_id]
    if user_signed_in?
      @comment.user_id = current_user.id
    end
    @comment.save
    redirect_to recipe_path(@comment.recipe)
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    @comment = Comment.destroy(@comment)
    flash.notice = "Comment Destroyed!"
    redirect_to recipe_path(@comment.recipe)
  end

  private
  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
