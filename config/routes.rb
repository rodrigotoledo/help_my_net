Rails.application.routes.draw do
  resources :messages
  devise_for :employees, :controllers => { :registrations => 'employees' }
  resources :tasks do
    resources :messages
    member do
      get 'dashboard'
    end
  end
  resources :companies
  devise_for :users, :controllers => { :registrations => 'users' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users
  resources :employees do
    collection do
      get :for_select
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
  namespace :api, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    # devise_for :users,
    #   controllers: {
    #       sessions: 'api/sessions',
    #       registrations: 'api/registrations'
    #   }
    resources :tasks
  end
  mount ActionCable.server => '/cable'
end
