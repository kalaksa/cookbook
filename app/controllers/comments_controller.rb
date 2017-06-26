class CommentsController < ApplicationController
  before_action :set_recipe, only: [:create]
  def create
    @comment = @recipe.comments.build(comment_params)
    if user_signed_in?
      @comment.user_id = current_user.id
    end
    if @comment.save
      redirect_to recipe_path(@comment.recipe)
    else
      flash.alert = "Comment can't be blank!"
      redirect_to recipe_path(@comment.recipe)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    @comment.destroy
    flash.notice = 'Comment Destroyed!'
    redirect_to recipe_path(@comment.recipe)
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
