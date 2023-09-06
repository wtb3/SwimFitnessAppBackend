# config/routes.rb
Rails.application.routes.draw do
  resources :users, only: [:create, :show, :update, :destroy]
  resources :exercises, only: [:index, :show, :create, :update, :destroy]
  resources :routines, only: [:create, :show, :update, :destroy]
  resources :sessions, only: [:create]

  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  post "/routines", to: "routines#create"
  post "/exercises", to: "exercises#create"
  post "/users", to: "users#create"
  # update "/routines", to: "routines#update"
  # update "/exercises", to: "exercises#update"
  # update "/users", to: "users#update"
  edit "/routines", to: "routines#edit"
  edit "/exercises", to: "exercises#edit"
  edit "/users", to: "users#edit"
  destroy "/routines", to: "routines#destroy"
  destroy "/exercises", to: "exercises#destroy"
  destroy "/users", to: "users#destroy"
  destroy "/logout", to: "sessions#destroy"
  destroy "/sessions", to: "sessions#destroy"

  # Add this line for login

  # Add more routes as needed
end
