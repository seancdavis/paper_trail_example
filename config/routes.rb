# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts
  post '/posts/:id/restore/:version', to: 'posts#restore', as: 'restore_post'

  resources :sessions, only: %i[new create destroy]

  root 'posts#index'
end
