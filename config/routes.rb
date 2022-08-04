# frozen_string_literal: true

Rails.application.routes.draw do
  get '/posts/activity', to: 'posts#activity', as: 'posts_activity'
  post '/posts/restore/:version', to: 'posts#restore', as: 'restore_post'
  resources :posts

  resources :sessions, only: %i[new create destroy]

  root 'posts#index'
end
