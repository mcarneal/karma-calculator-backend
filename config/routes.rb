Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :users
        resources :events
        resources :comments
        post '/signup', to: 'auth#create'
        post '/login', to: 'auth#login'
        get '/auto_login', to: 'auth#auto_login'
        mount ActionCable.server => '/cable'
    end
  end
end
