Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :task, only: [:show, :new, :create, :destroy, :update]
  resources :user, only: [:new, :edit]
  resources :user_task, only: [:create, :destroy]
  # resources :session, only: [:new, :create, :destroy]
  
  root to: "home#index"

  get "/tasks", to: "task#index"

  get "/tasks/new", to: "task#new"
  post "/tasks/", to: "task#create"

  get "/tasks/:id", to: "task#edit"
  patch "/tasks/:id", to: "task#update", as: "task_update"

  post "/users/", to: "user#create"

  # get "/sessions/", to: "session#new"
  # post "/sessions/:id", to: "session#login", as: "login"
  # post "/sessions/:id", to: "session#logout"
end