class ProgramsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_program, only: [:show, :edit, :update, :destroy]
    before_action :get_category, only: [:create, :update]

    def index
      if params[:category_id]
        @category = Category.find(params[:category_id])
        @programs = @category.programs
      else
        @programs = Program.all
      end
    end

    def new
      if params[:category_id]
        @program = Program.new
        @category = Category.find(params[:category_id])
      else
        @program = Program.new
        @program.build_category
      end
      
    end

    def create
      @program = Program.new(program_params)
      @program.creator_id = current_user.id
      @program.category_id = @category.id
     
        if @program.save
          redirect_to category_program_path(@category, @program)
        else
          render :new
        end
    end

    def edit
      if params[:category_id]
        category = Category.find_by(id: params[:category_id])
        if category.nil?
          redirect_to categories_path, alert: "Category not found."
        else
          @program = category.programs.find_by(id: params[:id])
          redirect_to category_programs_path(category), alert: "Program not found." if @program.nil?
        end
        else
        @program = Program.find(params[:id])
      end
    end

    def update
      @program.update(program_params)
      @program.category_id = @category.id
      
      redirect_to category_program_path(@category, @program)
    end

    def show
    end

    def destroy
      @program.destroy!
      redirect_to programs_path
    end

    private

    def set_program
      @program = Program.find(params[:id])
    end

    def get_category
      @category = Category.find(params[:category_id])
      if @category.nil?
        @category = Category.create(name: params[:program][:category_attributes][:name])
      end
    end

    def program_params
      params.require(:program).permit(:name, :website, :description, category_attributes: [:name])
    end

end

