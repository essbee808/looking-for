Rails.application.routes.draw do

  root to: "application#home"

  namespace :users do
    get '/created_programs', to: 'dashboard#created_programs'
    get '/top_creators', to: 'dashboard#top_creators'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations', 
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks",
  }
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  get '/auth/:provider/callback', to: 'omniauth_callbacks#google_oauth2'

  get '/about', to: 'application#about'
  get '/search', to: 'application#home'

  post '/programs/:id/edit', to: 'programs#edit'
  
  resources :bookmarks
  resources :programs

  resources :categories do
    resources :programs
  end
  
end