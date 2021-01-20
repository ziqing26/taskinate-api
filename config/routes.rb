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
    end
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
