class ProgramsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

    def index
        @programs = Program.all
    end

    def new
    end

    def create
        #binding.pry
        @program = Program.new(name: params[:name], website: params[:website], description: params[:description])
        @program.user_id = current_user.id
       
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

   
end

