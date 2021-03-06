class BookmarksController < ApplicationController
  # before_action :find_recipe, only: :create
  before_action :find_bookmark, only: :destroy

  def index
    @bookmarks = Bookmark.where(user: current_user)
  end

  def create
    @bookmark = Bookmark.new
    # @recipe = Recipe.new
    # @recipe = Crypto.find(params[:crypto_id]) < CHANGE IF NECESSARY AS COPIED FROM CRYPTAUL
    @bookmark.user = current_user
    @bookmark.recipe = @recipe

    if @bookmark.save!
      redirect_back(fallback_location: root_path)
    else
      render 'recipes/show'
    end
  end

  def destroy
    @recipe = @bookmark.recipe
    @bookmark.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # def find_recipe
  #   @recipe = Recipe.find(params[:id])
  # end
end
