Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :merchants do
    resources :items, only: [:index, :new, :create, :update]
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
  get '/profile/order/:id', to: 'orders#show', as: :profile_order
  patch '/profile/order/:id', to: 'orders#update', as: :cancel_order
  get '/edit_password', to: 'users#edit_password', as: :edit_password
  patch '/profile', to: 'users#update_password', as: :update_password
  get '/admin', to: 'admin/users#dashboard', as: :admin_dashboard
  get '/merchant', to: 'merchant_admins/users#dashboard', as: :merchant_dashboard

  scope :merchant_admins, module: :merchant_admins do
    resources :items, only: [:new, :create]
    #wonder if we should be namespacing all of these routes and having different views for the user and the merchant_admin. Is that what the merchant_admins/users#dashboard is for?
  end

  namespace :merchant_admins do
    resources :users
  end

  namespace :merchant_admins do
    resources :items, only: [:update]
    #route for merchant items update
  end

  namespace :admin do
    resources :users
  end

  namespace :admin do
    resources :merchants, only: [:show]
  end 
end
