class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def search
    ingredients = params[:ingredients]
    recipes = find_recipes
    unless recipes
      flash[:alert] = 'No recipes found!'
      return render action: :index
    end
    @recipes = recipes.first(5)
  end

  private

  def request_api(url)
    response = URI.open(url,
      'Content-Type' => 'application/json').read
    p response
    # puts response.read

    # JSON.parse
  end

  def find_recipes
    request_api(
      "https://api.spoonacular.com/recipes/findByIngredients?apiKey=#{ENV['SPOONACULAR_API_KEY']}&ingredients=onion"
    )
  end
end
