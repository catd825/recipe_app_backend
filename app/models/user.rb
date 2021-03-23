class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    # this returns all recipes a user has created
    has_many :recipes, class_name: :Recipe, foreign_key: "recipe_creator_id", dependent: :destroy
    has_many :favorite_recipes, class_name: :FavoriteRecipe, foreign_key: "recipe_liker_id", dependent: :destroy
end
