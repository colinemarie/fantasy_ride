Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :vehicles, only [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :vehicles, only: [ :index, :show ]
end


