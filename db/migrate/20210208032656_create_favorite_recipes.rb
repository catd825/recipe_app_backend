class CreateFavoriteRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_recipes do |t|

      t.boolean :favorited
      t.references :recipe, index: true, null: false, foreign_key: true
      t.references :recipe_liker, index: true, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
