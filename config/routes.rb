# frozen_string_literal: true
Rails.application.routes.draw do
  resources :characters
  resources :weapons
  resources :shields
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'
end
