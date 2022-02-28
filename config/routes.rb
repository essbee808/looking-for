Rails.application.routes.draw do
  root to: "application#dashboard"

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

  post '/saved', to: 'user_programs#create'

  get '/bookmarks', to: 'user_programs#index'
  get '/about', to: 'application#about'
  get '/contact', to: 'application#contact'
  
  resources :user_programs
  resources :programs

  resources :categories do
    resources :programs, only: [:index, :new, :create, :show]
  end
  
end