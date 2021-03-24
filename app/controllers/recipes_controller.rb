class RecipesController < ApplicationController

    before_action :find_recipe, only: [:show, :destroy, :update]
    # skip_before_action :verify_authenticity_token
    
    def index
        recipes = Recipe.all 
        render json: recipes.to_json
    end

    def show
        find_recipe
    end

    def create
        recipe = current_user.recipes.create(recipe_params)
        if recipe.valid?
            render json: recipe.to_json, status: :created
        else
            render json: { error: 'failed to create recipe' }, status: :not_acceptable
        end
    end

    def update
        @recipe.update(recipe_params)
        if @recipe.valid?
            render json: current_user.recipes.to_json
        else
            render json: { error: 'failed to edit recipe' }, status: :not_acceptable
        end
    end

    def destroy 
        @recipe.destroy
        render json: current_user.recipes.to_json
    end

    private 

    def recipe_params
        params.require(:recipe).permit(:title, :ingredients, :instructions, :img_url) 
    end

    def find_recipe
        @recipe = recipe.find(params[:id])
    end

end
