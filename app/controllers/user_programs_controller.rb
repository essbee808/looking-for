class UserProgramsController < ApplicationController

 def index
    @bookmarked_programs = UserProgram.all.where(user_id: current_user.id)    
 end

 def new
 end

 def create
   binding.pry
    @user_program = UserProgram.new(user_program_params)
    @user_program.save
    redirect_to user_programs_path
 end

 def destroy
   set_user_program
   @program = Program.find_by_id(@user_program.program_id)
   @user_program.destroy
   redirect_to program_path(@program)
 end

 private

 def set_user_program
   @user_program = UserProgram.find_by_id(params[:id])
 end

 def user_program_params
    params.require(:user_program).permit(:program_id, :user_id)
 end

end