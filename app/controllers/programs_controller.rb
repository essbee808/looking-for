class ProgramsController < ApplicationController
    before_action :authenticate_user!, :except => [:index]

    #before_action :set_program, only: [:show, :edit, :update, :destroy]
   

    def index
      @programs = Program.all
    end

    def new
      #binding.pry
      @program = Program.new
      @program.build_category
    end

  
    def create
      binding.pry
        @program = @category.programs.build(program_params)
       # binding.pry
        @program.creator_id = current_user.id
        #
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

    # def set_program
    #   #binding.pry
    #   @category = Category.find(params[:category_id])
    #   @program = @category.programs.find(params[:id])
    # end

    def program_params
      params.require(:program).permit(:name, :website, :description, category: [:name])
    end

end

