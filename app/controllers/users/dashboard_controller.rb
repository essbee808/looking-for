class Users::DashboardController < ApplicationController

  def created_programs
  end

  def top_creators
    @users = User.non_admin.sort_by{|user| user.total_programs }
  end
  
end
