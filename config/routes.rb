# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users # Routes for authentication
  # Defines the root path route ("/")
  root "splashes#index"
  resources :spends
  resources :groups
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
end
