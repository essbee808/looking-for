Rails.application.routes.draw do
  get 'organizations/new'
  get 'organizations/edit'
  get 'organizations/index'
  root to: "programs#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations', 
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  get '/auth/:provider/callback', to: 'omniauth_callbacks#google_oauth2'
  resources :programs
  post 'programs/new', to: "programs#create"
end
