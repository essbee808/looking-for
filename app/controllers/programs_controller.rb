class ProgramsController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    def index
        @programs = Program.all
    end

    def new
    end

    def create
        #binding.pry
        @program = Program.new(program_params)
        @program.creator_id = current_user.id
        binding.pry
        if @program.save
          redirect_to program_path(@program)
        else
          render :new
        end
    end

    def edit
      @program = Program.find_by(id: params[:id])
    end

    def update
      
    end

    def show
        @program =  Program.find_by(id: params[:id])
    end


    def destroy
    end

    private

    def program_params
      params.require(:program).permit(:name, :website, :description, :creator_id)
    end

end

