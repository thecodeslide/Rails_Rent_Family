Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'pages#home'
  resources :categories, only: [:show, :index, :new, :create, :edit, :update] do
    resources :bookings, only: [:create, :new, :edit]
  end

  resources :bookings, only: :index

  get 'my_page', to: 'users#my_page', as: :my_page
  get 'index', to: 'users#index', as: :search_result #added
end
