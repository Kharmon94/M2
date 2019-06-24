Rails.application.routes.draw do
  # resources :orders
  # resources :line_items
  # resources :carts
  mount Spree::Core::Engine, at: '/store'
  resources :products
  resources :posts
  resources :contacts
  resources :charges
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get 'pages/about'
   root to: "pages#home"
end
