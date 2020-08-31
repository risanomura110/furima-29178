Rails.application.routes.draw do
   devise_for :users

  root  'items#index'
    get  '/users'  to: 'devise/registrations#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: :index
end
