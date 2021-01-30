Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks
    end
    namespace :v2 do
      resources :tags
    end
    namespace :v3 do
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'sessions#is_logged_in?'
      # resources :sessions, only: [:create]
      # resources :registrations, only: [:create]
      resources :users, only: [:create, :show, :index]
    end
  end
  root 'static#home'
  get '*/path' => 'static#home'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
