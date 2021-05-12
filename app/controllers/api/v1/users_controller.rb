class Api::V1::UsersController < ApplicationController
    # prevents asking users to log in before they have created an account
    skip_before_action :authorized, only: [:create]
    # fixes 422 error
    # skip_before_action :verify_authenticity_token
    
    def index
      render json: User.all.to_json
    end

    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
      @user = User.create(user_params)
      if @user.valid?
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end

    def retrieve_recipes
      recipes = @user.recipes
      recipes = recipes.sort_by{ |recipe| recipe.date }
      render json: recipes.to_json
    end
     
    private
    
    def user_params
        params.require(:user).permit(:username, :password, :bio, :name)
    end

end
