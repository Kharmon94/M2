Rails.application.routes.draw do
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :products
  resources :posts
  resources :contacts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   get 'pages/about'
   root to: "pages#home"
end
