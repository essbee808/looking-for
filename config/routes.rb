Rails.application.routes.draw do
  root to: "categories#index"

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
  
  patch '/programs/:id/edit', to: 'programs#update'
  delete '/programs/:id', to: 'programs#destroy'

  delete '/categories/:id', to: 'categories#destroy'

  get '/dashboard', to: 'user_programs#dashboard'
  
  resources :categories
  resources :programs
  
end