Rails.application.routes.draw do
  root "dashboard#dashboard"
  get '/login', to: 'dashboard#login'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :events do
    member do
      get 'download'
    end
  end
  get '/admin/pending-events', to: 'dashboard#pending_events'
  get '/history', to: 'dashboard#history'
end
