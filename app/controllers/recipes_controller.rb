class RecipesController < ApplicationController
  def index
  end

  # def search
  #   ingredients = params[:ingredients]
  #   recipes = find_recipes
  #   unless recipes
  #     flash[:alert] = 'No recipes found!'
  #     return render action: :index
  #   end
  #   @recipes = recipes.first(5)
  # end

  # private

  # def request_api(url)
  #   url = URI("https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=apples%2C%20flour%2C%20sugar&number=5&ignorePantry=true&ranking=1")

  #   http = Net::HTTP.new(url.host, url.port)
  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  #   request = Net::HTTP::Get.new(url)
  #   request["X-RapidAPI-Host"] = 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com'
  #   request["X-RapidAPI-Key"] = ENV['RAPIDAPI_API_KEY']

  #   response = http.request(request)
  #   puts response.read_body
  # end

  # def find_recipes
  #   request_api(
  #     "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?ingredients=apples%2C%20flour%2C%20sugar&number=5&ignorePantry=true&ranking=1"
  #   )
  # end
end
