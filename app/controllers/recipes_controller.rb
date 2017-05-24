class RecipesController < ApplicationController
  include RecipesHelper
  def index
    @recipes = Recipe.all
  end
  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @comment.recipe_id = @recipe.id
  end
  def new
    @recipe = Recipe.new
  end
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
    flash.notice = "Recipe '#{@recipe.title}' Created!"
    redirect_to recipe_path(@recipe)
  end
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe = Recipe.destroy(@recipe)
    flash.notice = "Recipe '#{@recipe.title}' Destroyed!"
    redirect_to recipes_path
  end
  def edit
    @recipe = Recipe.find(params[:id])
  end
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    flash.notice = "Recipe '#{@recipe.title}' Updated!"
    redirect_to recipe_path(@recipe)
  end


end
