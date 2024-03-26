Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :tasks, only: [:show, :new, :create, :destroy]
  resources :users, only: [:new, :edit]
  resources :user_tasks, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  
  root to: "home#index"


  get "/tasks", to: "tasks#index"

  # get "/tasks/new", to: "tasks#new"
  post "/tasks/", to: "tasks#create"

  get "/tasks/:id/edit", to: "tasks#edit", as: "edit_task"
  patch "/tasks/:id", to: "tasks#update", as: "update_task"


  # get "users/new", to: "users#new"
  post "/users/", to: "users#create"

  post "/login", to: "sessions#login", as: "login"
  delete "/logout", to: "sessions#logout"
end