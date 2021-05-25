require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do

  
  scope '/dashboard' do
    resources :organizations, except: [:index] do
      member do
        get :events
        get :appropriations
        get :orders
      end
      resources :business_infos, only: [:new, :create]
    end
  end
  
  root "events#index"

  devise_for :users

  resources :dashboards, path: 'dashboard', only: [:index, :show] do 
    member do 
      get :contact, controller: :dashboards, action: 'new'
      post :contact, controller: :dashboards, action: 'create'
    end
  end

  resources :events do
    resources :booking, only: [:index, :show]
  end

  resources :line_items, only: [:create, :destroy]
    post '/line_items/random_create', to: 'line_items#random_create'
  resource :carts, only: [:destroy]

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
