class ProgramsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_program, only: [:update, :destroy]

    def index
      if params[:category_id]
        @category = Category.find_by_id(params[:category_id])
        if @category.nil?
          redirect_to categories_path, alert: "Category not found"
        else
          @programs = @category.programs
        end
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
        @program = Program.new(program_params)
        @program.creator_id = current_user.id
        binding.pry
        if params[:category_id]
          @category = Category.find_by_id(params[:program][:category_id])
          @program.category_id = @category.id
        else
          @category = Category.create(name: params[:program][:category][:name])
        binding.pry
        if @category.nil?
          @category = Category.create(name: params)
        end
        @program.category_id = @category.id

        if @program.save
          flash[:success] = "Program saved successfully."
          redirect_to category_program_path(@category, @program)
        else
          flash.now[:error] = "Program could not be saved."
          render :new
        end
    end

    def show
      if params[:category_id]
        @category = Category.find_by(id: params[:category_id])
        @program = @category.programs.find_by(id: params[:id])
        if @program.nil?
          redirect_to category_programs_path(@category), alert: "Program not found"
        end
      else
        @program = Program.find(params[:id])
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

