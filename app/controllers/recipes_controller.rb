class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update, :edit]
  before_action :set_recipe, only: [:show, :destroy, :edit, :update]

  def index
    @recipes = Recipe.all
  end

  def show
    @comment = Comment.new
    @comment.recipe_id = @recipe.id
  end

  def new
    @recipe = current_user.recipes.build
    authorize! :create, @recipe
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash.notice = "Recipe '#{@recipe.title}' Created!"
      redirect_to recipes_path(@recipe)
    else
      flash.alert = "Fill in all fields!"
      render :new
    end
  end

  def destroy
    authorize! :destroy, @recipe
    @recipe = Recipe.destroy(@recipe)
    flash.notice = "Recipe '#{@recipe.title}' Destroyed!"
    redirect_to recipes_path
  end

  def edit
    authorize! :update, @recipe
  end

  def update
    if @recipe.update(recipe_params)
      flash.notice = "Recipe '#{@recipe.title}' Updated!"
      redirect_to recipe_path(@recipe)
    else
      flash.alert = "Fill in all fields!"
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :components, :body, :tag_list, :image)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
