# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :posts

  root 'application#home'
end
