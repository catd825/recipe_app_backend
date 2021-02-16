class Recipe < ApplicationRecord
    belongs_to :recipe_creator, class_name: :User, foreign_key: "user_id", optional: true
    has_many :favorite_recipes
end
