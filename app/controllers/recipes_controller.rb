class RecipesController < ApplicationController
    
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
            render json: post.to_json, status: :created
        else
            render json: { error: 'failed to create post' }, status: :not_acceptable
        end


    end

    private 

    def recipe_params
        params.require(:recipe).permit(:title, :ingredients, :instructions, :img_url) 
    end

    def find_recipe
        @recipe = recipe.find(params[:id])
    end

end
