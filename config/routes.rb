Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'users/index'
  get 'users/show'
  devise_for :users
  get "articles",to: "articles#index"
  resources :users
 resources :articles 
 resources :articles do
  resources :comments
end
  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'pages#home'
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
