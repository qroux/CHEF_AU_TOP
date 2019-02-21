Rails.application.routes.draw do
  resources :services do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:destroy, :show, :index]
  get '/my_bookings', to: 'bookings#list_chief_bookings'
  get '/about', to: 'pages#about'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
