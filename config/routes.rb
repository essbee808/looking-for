Rails.application.routes.draw do
  root to: 'application#welcome'

  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks"}
  
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  get '/auth/:provider/callback', to: 'omniauth_callbacks#google_oauth2'

end
