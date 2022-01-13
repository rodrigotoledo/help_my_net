Rails.application.routes.draw do
  resources :tasks
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  mount ActionCable.server => '/cable'
end
