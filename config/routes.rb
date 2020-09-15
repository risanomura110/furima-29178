Rails.application.routes.draw do
   devise_for :users
  root  'items#index'
  resources :items do
    resources :orders, only: [:create, :index]
    resources :comments, only: :create
  end
end