# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :tournaments

  get '/settings', to: 'user_settings#show'
  match 'settings/edit' => 'user_settings#edit', via: :get, as: :edit_settings

  get 'home/index'
  devise_for :users
  root to: 'home#index'

  namespace :admin do
    resources :addresses
    resources :alleys
    resources :tournaments
    resources :user_settings
    resources :users
    mount Sidekiq::Web => '/sidekiq'

    root to: 'alleys#index'
  end

  resources :alleys
  resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
