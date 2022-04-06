class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :duration
      t.string :dietary_requirement

      t.timestamps
    end
  end
end
