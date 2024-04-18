Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :tasks, only: [:show, :new, :create, :destroy]
  resources :users, only: [:edit]

  root to: 'home#index'

  get '/tasks', to: 'tasks#index'
  post '/tasks/', to: 'tasks#create'
  get '/tasks/:id/edit', to: 'tasks#edit', as: 'edit_task'
  patch '/tasks/:id', to: 'tasks#update', as: 'update_task'

  get '/signup/', to: 'users#new', as: 'new_user'
  post '/signup/', to: 'users#create'
  delete '/unsubscribe', to: 'users#destroy'

  get '/login', to: 'sessions#new'
  post '/login/send', to: 'sessions#login', as: 'login_send'
  delete '/logout', to: 'sessions#logout', as: 'logout'

  get '/session_timeout', to: 'application#session_timeout'
end
