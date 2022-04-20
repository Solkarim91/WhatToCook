class AddIngredientsAndMethodToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :ingredients, :string
    add_column :recipes, :method, :string
  end
end
