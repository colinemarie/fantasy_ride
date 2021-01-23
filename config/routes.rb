Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :vehicles, only: [ :new, :create, :edit, :destroy ,:index, :show, :update ] do
    resources :reservations, only: [ :new, :create ]
  end
  resources :reservations, only: [:index, :destroy,] do
    member { patch :cancel, :decline, :accept }
  end
  resources :my_vehicles, only: [ :index ] do
    resources :vehicle_reservations, only: [ :index ]
  end
end


 # resources :reservations, only: [ :index ]
