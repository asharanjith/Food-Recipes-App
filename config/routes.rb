Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'recipes#index'
  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  resources :recipes

  put '/recipes/:id/toggle_privacy', to: 'recipes#toggle_privacy', as: 'toggle_recipe_privacy'

end
