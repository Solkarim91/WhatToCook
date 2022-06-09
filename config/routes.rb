Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :recipes, only: [:index, :show]
  resources :bookmarks

  get 'search', to: 'recipes#index'
  get 'my_recipes', to: 'bookmarks#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
