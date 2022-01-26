Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations', 
    sessions: 'users/sessions',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
    root to: 'devise/sessions#home'
  end

  get '/auth/:provider/callback', to: 'omniauth_callbacks#google_oauth2'

end
