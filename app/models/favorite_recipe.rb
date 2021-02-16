class FavoriteRecipe < ApplicationRecord
    belongs_to :recipe_liker, class_name: :User, foreign_key: "user_id", optional: true
    belongs_to :recipe, class_name: :Recipe, foreign_key: "recipe_id"
end
