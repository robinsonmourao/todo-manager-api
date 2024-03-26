Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :tasks, only: [:show, :new, :create, :destroy]
  resources :users, only: [:edit]
  resources :user_tasks, only: [:create, :destroy]
  
  root to: "home#index"


  get "/tasks", to: "tasks#index"

  # get "/tasks/new", to: "tasks#new"
  post "/tasks/", to: "tasks#create"

  get "/tasks/:id/edit", to: "tasks#edit", as: "edit_task"
  patch "/tasks/:id", to: "tasks#update", as: "update_task"


  get "/signup/", to: "users#new", as: "new_user"
  post "/signup/", to: "users#create"

  delete "/unsubscribe", to: "users#destroy"


  get "/login", to: "sessions#new"
  post "/login/send", to: "sessions#login", as: "login_send"

  delete "/logout", to: "sessions#logout", as: "logout"
end