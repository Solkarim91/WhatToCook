class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :destroy, :create]

  def index
    @bookmark = Bookmark.new
    @ingredients = []
    @ingredients.push(params[:ingredients])
    recipes = find_recipes
    unless recipes
      flash[:alert] = 'No recipes found!'
      return render action: :index
    end
    @recipes = JSON.parse(recipes)
  end

  # def new
  #   @recipe = Recipe.new
  # end

  def create
    # @recipe = Recipe.new(recipe_params)
    @saved_recipe = Recipe.new
    @saved_recipe.name = @recipe['title']
    @saved_recipe.duration = @recipe['title']
    @saved_recipe.method = @recipe['instructions'].gsub(".", '.<br/>').html_safe
    @saved_recipe.ingredients = @recipe['extendedIngredients']
    @saved_recipe.image = @recipe['image']
    @saved_recipe.user_id = current_user.id
    if @saved_recipe.save!
      # redirect_to my_recipes_path
      redirect_back(fallback_location: root_path)
    else
      # render :new
      render 'recipes/show'
    end
  end

  def show
    @bookmark = Bookmark.new
  end

  def destroy
    @recipe.destroy
    redirect_to my_recipes_path
  end

  private

  # def recipe_params
  #   params.require(:recipe).permit(:name, :duration, :ingredients, :method, :image)
  # end
end
