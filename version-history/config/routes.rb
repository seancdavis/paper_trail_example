# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :channels, only: %i[index show] do
    resources :posts, only: %i[create index edit update]
  end

  root 'posts#home'
end
