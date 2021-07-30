Rails.application.routes.draw do
  resources :tournaments
  resources :contacts
  resources :user_settings
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
