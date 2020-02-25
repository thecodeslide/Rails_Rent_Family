Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :member
  resources :bookings
  resources :category
end
