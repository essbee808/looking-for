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
          @program = @category.programs.build
        else
          @program = Program.new
        end
    end

    def create
      if params[:category_id]
        get_category_by_id
        @program = @category.programs.build(program_params)
      else 
        @program = Program.new(program_params)
        get_category_by_id
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
      if set_program
        render :show
      else
        redirect_to programs_path
      end
    end

    def edit
      @program = Program.find_by(params[:id])
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

    def get_category_by_id
      @category = Category.find_by_id(params[:program][:category_id])
    end

    def set_program
      @program = Program.find_by_id(params[:id])
    end

    def program_params
      params.require(:program).permit(:name, :website, :description, :category_id, category_attributes: [:name])
    end
end

