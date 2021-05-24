require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  resources :organizations
  devise_for :users
  resources :events do
    resources :booking, only: [:index, :show]
  end
  resources :line_items, only: [:create, :destroy]
    post '/line_items/random_create', to: 'line_items#random_create'
  resource :carts, only: [:destroy]
  root "events#index"

  
  resource :cart, only: [:show, :destroy] do
    collection do
      get :checkout
    end
  end

  delete "/carts/empty", to: 'carts#empty_cart'

  resources :orders, only: [:show, :create] do
    collection do
      post :return_url
    end
  end
  mount Sidekiq::Web => '/sidekiq'
  
end
