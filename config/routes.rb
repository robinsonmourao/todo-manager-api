Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :task, only: [:new, :create, :destroy]

  root to: "home#index"

  get "/tasks", to: "task#index"

  # so renderiza a tela inicial VER SE DA PRA TIRAR DEPOIS
  post "/tasks/", to: "task#create"
  # renderiza pagina para cadastrar novas tarefas
  get"/tasks/new", to: "task#new"
end
