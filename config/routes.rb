Rails.application.routes.draw do
  resources :squares
  resources :boards

  post '/players', to: 'players#create'
  get '/players', to: 'players#index'
  get '/players/:id', to: 'players#show'
  post '/board', to: 'boards#create'
  put '/boards/:id', to: 'boards#update'
  get '/board/:id', to: 'boards#show'
  get '/boardSquares/:id', to: 'boards#getSquares'
  post '/square',to:'squares#create'
  put '/square/:id',to:'squares#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
