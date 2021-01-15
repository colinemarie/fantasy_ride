Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :vehicles, only: [ :index, :show ] do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:index]
end


