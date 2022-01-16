Rails.application.routes.draw do
  devise_for :employees
  resources :employees
  resources :companies
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
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
