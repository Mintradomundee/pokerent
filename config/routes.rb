Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :pokemons, only: [:index, :new, :create, :show] do
    resources :transactions, only: [:index, :show, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
