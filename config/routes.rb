# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :tournaments

  get '/settings', to: 'user_settings#show'
  match 'settings/edit' => 'user_settings#edit', via: :get, as: :edit_settings

  resources :alleys
  resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
