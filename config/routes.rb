Rails.application.routes.draw do
  devise_for :employees, :controllers => {:registrations => "employee_registrations"}
  devise_for :users, :controllers => {:registrations => "user_registrations"}
  resources :companies
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :tasks do
    resources :messages
    member do
      get 'dashboard'
    end
  end
  resources :users
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"
  mount ActionCable.server => '/cable'
end
