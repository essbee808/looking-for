class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :set_admin, only: [:home]

    before_action :configure_permitted_params, if: :devise_controller?

    include ApplicationHelper

    def about
    end

    def home
        if params[:query]
            @parameter = params[:query].downcase
            @programs = Program.all.where("lower(name) LIKE ?", "%#{@parameter}%")
            @categories = Category.all.where("lower(name) LIKE ?", "%#{@parameter}%")
        end
    end

    protected

    def configure_permitted_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation])
    end

    def set_admin
        if current_user.email.match(/factfamily.org/)
            current_user.admin = true
        end
    end  
end
