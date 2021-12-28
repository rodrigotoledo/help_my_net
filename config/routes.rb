Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :tasks, except: %i[show] do
    resources :messages
  end
  resources :categories
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'tasks#index'

  namespace :api, defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    # devise_for :users,
    #   controllers: {
    #       sessions: 'api/sessions',
    #       registrations: 'api/registrations'
    #   }
    resources :tasks
    mount ActionCable.server => '/cable'
  end


end
