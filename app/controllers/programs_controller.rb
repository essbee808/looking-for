class ProgramsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_program, except: [:index, :new, :create]
    before_action :is_invalid, only: [:show, :edit]

    def index
      if params[:category_id]
        find_category
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
        @category = Category.find_by_id(params[:program][:category_id])
        @program = @category.programs.build(program_params)
      else 
        @program = Program.new(program_params)
        @category = Category.find_by_id(params[:program][:category_id])
        if @category.nil?
          @program.category = Category.create(name: params[:program][:category][:name])
        end
      end

      @program.creator_id = current_user.id

      if @program.save
        redirect_to category_program_path(@category, @program)
      else
        render :new
      end
    end

    def show
    end

    def edit
    end

    def update
      #binding.pry
     #check for admin access
      @program.update(program_params)
      redirect_to program_path(@program)
    end

    def destroy
      @program.destroy!
      redirect_to programs_path
    end

    private

    def find_category
      @category = Category.find_by_id(params[:category_id])
    end

    def set_program
      @program = Program.find_by_id(params[:id])
    end

    def is_invalid
      #binding.pry
      if !set_program
        redirect_to programs_path
      end
    end

    def program_params
      params.require(:program).permit(:name, :website, :description, :category_id, category_attributes: [:name])
    end
end

