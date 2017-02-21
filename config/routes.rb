Rails.application.routes.draw do
  root 'static_pages#home'

  #Session Controller routes
  get "signin", to: "sessions#new"
  get "signout", to: "sessions#destroy"
  post "/sessions/create", to: "sessions#create"

  #Rides Controlller routes
  post "rides/new", to: "rides#new"

  resources :users
  resources :attractions
end
