Rails.application.routes.draw do

  root "application#welcome"
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#delete'
  get '/users/new' => "users#new", as: "signup"

  resources :users, only: [:create,:show]
  resources :attractions, only: [:new,:create,:index,:show,:edit,:update]

end