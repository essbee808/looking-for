class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!

    def about
    end

    def contact
    end

    def dashboard
    end

end
