class ProgramsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_program, except: [:index, :new, :create]

    def index
      if params[:category_id]
        @category = Category.find_by_id(params[:category_id])
        @programs = @category.programs
      else
        @programs = Program.all
      end
    end

    def new
        if params[:category_id]
          @category = Category.find_by_id(params[:category_id])
          @program = Program.new
          @program.build_category
        else
          @program = Program.new
        end
    end

    def create
      #binding.pry
      @program = Program.new(program_params)
      @category = Category.find_by_id(params[:program][:category_id])
      @program.category_id = @category.id
      @program.creator_id = current_user.id

      if @program.save
        redirect_to category_program_path(@category, @program)
      else
        render :new
      end
    end

    def edit
      @program = Program.find_by(params[:id])
    end

    def update
      @program.update(program_params)
      @program.category_id = @category.id
      
      if @program.save
        redirect_to @program
      else
        render :edit
      end
    end

    def destroy
      @program.destroy!
      redirect_to programs_path
    end

    private

    def set_program
      @program = Program.find_by_id(params[:id])
    end

    def program_params
      params.require(:program).permit(:name, :website, :description, category_attributes: [:name])
    end
end

