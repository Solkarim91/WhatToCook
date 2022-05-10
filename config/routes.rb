Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'my_search', to: 'recipes#index'
  # get '/search' => 'travel#search'
  get '/index' => 'recipes#index'
  # get '/search' => 'recipes#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
