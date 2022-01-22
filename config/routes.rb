Rails.application.routes.draw do
  resources :messages
  devise_for :employees
  resources :tasks
  resources :companies
  devise_for :users
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
  mount ActionCable.server => '/cable'
end
