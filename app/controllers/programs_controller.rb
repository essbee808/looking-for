class ProgramsController < ApplicationController
    before_action :authenticate_user!, :except => [:index]
    before_action :set_program, only: [:show, :edit, :update, :destroy]
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
    end

    def update
      
    end

    def show
    end


    def destroy
    end

    private

    def set_program
      @program = Program.find(params[:id])
    end

    def program_params
      params.require(:program).permit(:name, :website, :description, :creator_id, :category_id)
    end

end

