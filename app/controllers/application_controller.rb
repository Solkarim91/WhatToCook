class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def request_api(url)
    URI.open(url,
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
    # @recipe_instructions = @recipe['instructions'].split('.')
  end
end
