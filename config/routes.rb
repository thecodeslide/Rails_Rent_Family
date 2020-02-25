Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :category, only: [:show, :index, :new, :create] do
    resources :booking, only: [:index, :update, :create]
  end
  resources :user, only: :show
end
