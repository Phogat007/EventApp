Rails.application.routes.draw do
  root "dashboard#dashboard"
  get '/login', to: 'dashboard#login'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get "up" => "rails/health#show", as: :rails_health_check
  resources :events do
    member do
      get 'download'
    end
  end
  get '/admin/pending-events', to: 'dashboard#pending_events'
  get '/history', to: 'dashboard#history'
  get 'download', to: 'dashboard#download'
  get '/about', to: 'dashboard#about'
  get '/contact', to: 'dashboard#contact'
end
