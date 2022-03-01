class ProgramsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_program, except: [:index, :new, :create]
    before_action :is_invalid, only: [:show, :edit]
    before_action :is_creator, only: [:edit, :update, :destroy]

    def index
      if params[:category_id]
        find_category
        binding.pry
        @programs = @category.programs
      else
        @programs = Program.all
      end
    end

    def new
        if params[:category_id]
          find_category
          @program = @category.programs.build
        else
          @program = Program.new
        end
    end

    def create
      if params[:category_id]
        set_category
        @program = @category.programs.build(program_params)
      else 
        @program = Program.new(program_params)
        set_category
      end

      @program.creator_id = current_user.id

      if @program.save
        redirect_to category_program_path(@category, @program)
      else
        render :new
      end
    end

    def show
      find_bookmark
      find_category
    end

    def edit
    end

    def update
      @program.update(program_params)
      redirect_to program_path(@program)
    end

    def destroy
      @program.destroy!
      redirect_to programs_path
    end

    private

    def is_creator
      if current_user.id != @program.creator_id
        redirect_to programs_path
      end
    end

    def find_category
      @category = Category.find_by_id(params[:category_id])
    end

    def find_bookmark
      @bookmark = current_user.user_programs.find_by(program_id: params[:id])
    end

    def set_category
      @category = Category.find_by_id(params[:program][:category_id])
    end

    def set_program
      @program = Program.find_by_id(params[:id])
    end

    def is_invalid
      redirect_to programs_path if !set_program
    end

    def program_params
      params.require(:program).permit(:name, :website, :description, :category_id, category_attributes: [:name])
    end
end

