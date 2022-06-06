Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :recipes
  get 'search', to: 'recipes#index'
  get 'my_recipes', to: 'recipes#my_recipes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
