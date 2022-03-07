class Users::DashboardController < ApplicationController
  def show
  end

  def created_programs
  end

  def most_programs 
    @users = User.not_admin
  end
end
