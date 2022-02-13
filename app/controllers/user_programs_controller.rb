class UserProgramsController < ApplicationController

 def index
    @saved_programs = UserProgram.all.where(user_id: current_user.id)    
 end

 def new
 end

 def create
    @user_program = UserProgram.new(user_program_params)
    @user_program.save
    redirect_to user_programs_path
 end

 private

 def user_program_params
    params.require(:user_program).permit(:program_id, :user_id)
 end

end