module RecipesHelper
  def recipe_params
    params.require(:recipe).permit(:title,:components,:body)
  end

end
