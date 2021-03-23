class FavoriteRecipesController < ApplicationController
    
    def index
        favorite_recipes = FavoriteRecipe.all
        render json: favorite_recipes.to_json
    end

end
