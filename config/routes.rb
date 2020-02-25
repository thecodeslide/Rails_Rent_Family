Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :categories, only: [:show, :index, :new, :create, :edit, :update] do
    resources :bookings, only: [:index, :update, :create]
  end
  resources :users, only: :show
end
