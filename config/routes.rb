Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :categories, only: [:show, :index, :new, :create, :edit, :update] do
    resources :bookings, only: [:create, :new, :edit]
  end
  resources :users, only: :show
  resources :bookings, only: :index
end
