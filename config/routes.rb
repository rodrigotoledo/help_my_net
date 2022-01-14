Rails.application.routes.draw do
  resources :tasks do
    member do
      get 'dashboard'
    end
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
  mount ActionCable.server => '/cable'
end
