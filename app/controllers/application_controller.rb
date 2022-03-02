class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :set_admin, only: [:dashboard]

    include ApplicationHelper

    def about
    end

    def contact
    end

    def dashboard
        binding.pry
    end

end
