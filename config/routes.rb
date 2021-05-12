Rails.application.routes.draw do

  get 'api/v1/users/:id/favorite_recipes', to: 'api/v1/users#retrieve_favorite_recipes'
  get 'api/v1/users/:id/recipes', to: 'api/v1/users#retrieve_recipes'

  resources :favorite_recipes
  resources :recipes
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update, :index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
