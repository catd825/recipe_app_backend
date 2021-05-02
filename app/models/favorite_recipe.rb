class FavoriteRecipe < ApplicationRecord
    # this returns all users who have liked a recipe
    belongs_to :recipe_liker, class_name: :User, foreign_key: "user_id", optional: true, dependent: :destroy
    belongs_to :recipe, dependent: :destroy
end
