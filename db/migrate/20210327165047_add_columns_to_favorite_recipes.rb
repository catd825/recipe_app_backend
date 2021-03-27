class AddColumnsToFavoriteRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :favorite_recipes, :recipe_name, :string
    add_column :favorite_recipes, :recipe_img, :string
  end
end
