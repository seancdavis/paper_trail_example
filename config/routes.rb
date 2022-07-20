# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts, only: %i[index new create]
  resources :sessions, only: %i[new create destroy]

  get '/step', to: 'steps#show', as: :step
  post '/step/:step', to: 'steps#set_step', as: :set_step

  root 'pages#home'
end
