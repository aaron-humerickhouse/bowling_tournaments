# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tournaments
  resources :hosts

  get '/settings', to: 'user_settings#show'
  match 'settings/edit' => 'user_settings#edit', via: :get, as: :edit_settings

  get 'home/index'
  devise_for :users
  root to: 'home#index'

  namespace :admin do
    resources :alleys
    resources :addresses
    resources :users

    root to: 'alleys#index'
  end

  resources :alleys
  resources :addresses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
