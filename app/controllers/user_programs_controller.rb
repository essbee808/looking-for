class UserProgramsController < ApplicationController

 def index
    @bookmarked_programs = UserProgram.all.where(user_id: current_user.id)    
 end

 def new
 end

 def create
    @user_program = UserProgram.new(user_program_params)
    @user_program.save
    redirect_to category_program_path(@user_program.program.category, @user_program.program)
 end

 def destroy
   set_user_program
   @program = Program.find_by_id(@user_program.program_id)
   @user_program.destroy
   redirect_to category_program_path(@program.category, @program)
 end

 private

 def set_user_program
   @user_program = UserProgram.find_by_id(params[:id])
 end

 def user_program_params
    params.require(:user_program).permit(:program_id, :user_id)
 end

end