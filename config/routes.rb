Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :categories, only: [:show, :index, :new, :create] do
    resources :bookings, only: [:index, :update, :create, :new]
  end
  resources :users, only: :show
end
