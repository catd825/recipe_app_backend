class FavoriteRecipesController < ApplicationController
    before_action :find_favorite_recipe, only: [:show, :destroy, :update]
    # skip_before_action :verify_authenticity_token

    def index
        favorite_recipes = FavoriteRecipe.all
        render json: favorite_recipes.to_json
    end

    def show
        find_favorite_recipe
        render json: @favorite_recipe.to_json
    end

    def create
        favorite_recipe = FavoriteRecipe.create(favorite_recipe_params)
        # recipe = current_user.recipes.create(recipe_params)
        if favorite_recipe.valid?
            render json: favorite_recipe.to_json, status: :created
        else
            render json: { error: 'failed to create recipe' }, status: :not_acceptable
        end
    end

    def update
        @favorite_recipe.update(favorite_recipe_params)
        if @favorite_recipe.valid?
            render json: @favorite_recipe.to_json
            # render json: current_user.recipes.to_json
        else
            render json: { error: 'failed to edit recipe' }, status: :not_acceptable
        end
    end

    def destroy 
        @favorite_recipe.destroy
        render json: @favorite_recipe.to_json
        # render json: current_user.recipes.to_json
    end

    private 

    def favorite_recipe_params
        params.require(:favorite_recipe).permit(:favorited, :recipe_id, :recipe_liker_id, :recipe_name, :recipe_img) 
    end

    def find_favorite_recipe
        @favorite_recipe = FavoriteRecipe.find(params[:id])
    end
end
