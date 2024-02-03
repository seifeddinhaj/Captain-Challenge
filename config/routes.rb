# frozen_string_literal: true
Rails.application.routes.draw do
  resources :characters
  resources :weapons
  resources :shields
  resources :battles, only: %I[new create index]

  root 'battles#new'
end
