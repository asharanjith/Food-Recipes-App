Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "public_recipes#index"
  # Defines the root path route ("/")
  # root "articles#index"

  resources :users 

  resources :public_recipes, only: %i[index]
  put '/recipes/:id/toggle_privacy', to: 'recipes#toggle_privacy', as: 'toggle_recipe_privacy'
  get 'public_recipes/index'

  resources :foods
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end

  get '/shopping_lists/:recipe_id', to: 'shopping_lists#index', as: 'shopping_lists'
  get '/shopping_lists', to: 'shopping_lists#show', as: 'general_shopping_lists'


end
