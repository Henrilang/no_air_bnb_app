Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/users/:id/show', to: 'users#show', as: "show"
  resources :planets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
