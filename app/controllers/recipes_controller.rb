class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def search
    @ingredients = []
    @ingredients.push(params[:ingredients])
    recipes = find_recipes
    unless recipes
      flash[:alert] = 'No recipes found!'
      return render action: :index
    end
    @recipes = JSON.parse(recipes)
  end

  private

  def request_api(url)
    response = URI.open(url,
      'Content-Type' => 'application/json').read
    p response
  end

  def find_recipes
    request_api(
      "https://api.spoonacular.com/recipes/findByIngredients?apiKey=#{ENV['SPOONACULAR_API_KEY']}&ingredients=#{@ingredients.length == 1 ? @ingredients.first : @ingredients.join(",+")}"
    )
  end
end
