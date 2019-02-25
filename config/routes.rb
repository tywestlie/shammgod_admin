Rails.application.routes.draw do
  root 'welcome#index'

  resources :articles, only: [:show, :new, :create, :update, :destroy]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"


  get '/dashboard', to: 'users#show'

end
