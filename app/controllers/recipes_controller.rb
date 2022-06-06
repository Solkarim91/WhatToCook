class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :destroy]

  def index
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

  def show
  end

  def destroy
    @recipe.destroy
    redirect_to my_recipes_path
  end

  private

  def request_api(url)
    response = URI.open(url,
      'Content-Type' => 'application/json').read
  end

  def find_recipes
    request_api(
      "https://api.spoonacular.com/recipes/findByIngredients?apiKey=#{ENV['SPOONACULAR_API_KEY']}&ingredients=#{@ingredients.length == 1 ? @ingredients.first : @ingredients.join(",+")}"
    )
  end

  def find_recipe
    recipe = request_api(
      "https://api.spoonacular.com/recipes/#{params['id']}/information?apiKey=#{ENV['SPOONACULAR_API_KEY']}"
    )
    @recipe = JSON.parse(recipe)
  end
end
