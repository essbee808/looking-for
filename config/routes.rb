Rails.application.routes.draw do
  root to: "user_programs#dashboard"

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

  get '/dashboard', to: 'user_programs#dashboard'

  post '/user_programs', to: 'user_programs#create'

  get '/contact', to: 'application#contact'
  
  resources :user_programs, only: [:show]

  resources :categories do
    resources :programs, only: [:show, :index, :new, :create, :edit]
  end
  
  resources :programs
end