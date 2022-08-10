# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  scope '/channels/:channel_id' do
    resources :messages, only: %i[create index]
  end

  root 'messages#home'
end
