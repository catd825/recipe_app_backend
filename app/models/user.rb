class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }    
    # this returns all recipes a user has created
    has_many :recipes, class_name: :Recipe, foreign_key: "recipe_creator_id", dependent: :destroy
    # this returns all recipes a user has liked
    has_many :favorite_recipes, class_name: :FavoriteRecipe, foreign_key: "recipe_liker_id", dependent: :destroy

    # has_many :saved_recipes, :through => :favorite_recipes 
    has_many :saved_recipes, -> { select('recipes.*, favorite_recipes.favorited as favorited') }, :through => :favorite_recipes, dependent: :destroy
 
    def all_recipes 
      recipes + saved_recipes 
    end 

end

