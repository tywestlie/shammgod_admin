Rails.application.routes.draw do
  root 'welcome#index'
  get '/dashboard', to: 'users#show'
  # get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
end
