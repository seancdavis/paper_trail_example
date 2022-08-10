# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  resources :channels, only: %i[index show] do
    resources :messages, only: %i[create index edit update]
  end

  root 'messages#home'
end
