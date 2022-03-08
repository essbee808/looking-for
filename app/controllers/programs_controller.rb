class ProgramsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_program, except: [:index, :new, :create]
    before_action :is_invalid, only: [:show, :edit]
    before_action :verify_creator, only: [:edit, :update, :destroy]

    def index
      if params[:category_id]
        set_category
        @programs = @category.programs
      else
        @programs = Program.all.ordered_by_name
      end
    end

    def new
        if params[:category_id]
          set_category
          @program = @category.programs.build
        else
          @program = Program.new
          @program.build_category
        end
    end

    def create
      if params[:category_id]
        @category = Category.find_by(params[:category_id])
        @program = @category.programs.build(program_params)
      else
        @program = Program.new(program_params)
      end

      @program.creator_id = current_user.id

      if @program.save
        redirect_to category_program_path(@program.category_id, @program)
        
      else
        render :new
      end
    end

    def show
      set_category
      find_bookmark
    end

    def edit
    end

    def update
      @program.update(program_params)
      redirect_to program_path(@program)
    end

    def destroy
      binding.pry
      @program.destroy!
      redirect_to programs_path
    end

    private

    def verify_creator
      if current_user.id != @program.creator_id
        redirect_to programs_path
      end
    end

    def set_category
      @category = Category.find_by_id(params[:category_id])
    end

    def set_program
      @program = Program.find_by_id(params[:id])
    end

    def find_bookmark
      @bookmark = current_user.bookmarks.find_by(program_id: params[:id])
    end

    def is_invalid
      redirect_to programs_path if !set_program
    end

    def program_params
      params.require(:program).permit(:name, :organization, :website, :description, :category_id, category_attributes: [:name])
    end
end

