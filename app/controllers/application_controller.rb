class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :set_admin, only: [:dashboard]

    before_action :configure_permitted_params, if: :devise_controller?

    include ApplicationHelper

    def about
    end

    protected

    def configure_permitted_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation])
    end

end
