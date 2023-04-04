Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'recipes#index'
  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
<<<<<<<<< Temporary merge branch 1
  resources :recipes

=========
   
  resources :foods 
   
>>>>>>>>> Temporary merge branch 2
end
