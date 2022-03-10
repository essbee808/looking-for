class UsersController < ApplicationController
    def top_creators
        @users = User.non_admin
        @sorted = @users.sort_by{|a| a.total_programs}
        
    end
end
 