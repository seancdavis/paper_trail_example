# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  resources :sessions, only: %i[new create destroy]

  root 'posts#index'
end
