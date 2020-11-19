Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to:'pages#dashboard'


  resources :pokemons do
    resources :transactions, only: [:index, :show, :create, :destroy]
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
