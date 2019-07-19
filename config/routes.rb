Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :merchants do
    resources :items, only: [:index, :new, :create]
  end

  resources :items, only: [:index, :show, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:edit, :update, :destroy]

  get '/cart', to: 'cart#show'
	post '/cart/:item_id', to: 'cart#add_item'
  delete '/cart', to: 'cart#empty'
  patch '/cart/:change/:item_id', to: 'cart#update_quantity'
  delete '/cart/:item_id', to: 'cart#remove_item'

  # resources :orders, only: [:new, :create, :show]

  resources :users, only: [:new, :create, :show, :edit, :update] do
  	resources :orders, only: [:create, :show]
  end

  get '/profile', to: 'users#show', as: :profile
  get '/profile/orders', to: 'orders#index', as: :profile_orders
  get '/admin', to: 'admin/users#dashboard', as: :admin_dashboard
  get '/merchant', to: 'merchant_admins/users#dashboard', as: :merchant_dashboard

  namespace :merchant_admins do
    resources :users
  end

  namespace :admin do
    resources :users
  end
end
