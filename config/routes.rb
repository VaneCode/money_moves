# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users # Routes for authentication
  root "splashes#index" # Defines the root path route ("/")
  resources :groups do
    resources :spends
  end
  resources :users
end
  
