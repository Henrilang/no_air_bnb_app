Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :planets
  get '/users/:id/bookings', to: 'users#bookings', as: "bookings"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
