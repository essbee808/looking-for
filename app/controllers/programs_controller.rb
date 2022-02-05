class ProgramsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_program, only: [:show, :edit, :update, :destroy]
    before_action :get_category, only: [:create]

    def index
      @programs = Program.all
    end

    def new
      @program = Program.new
      @program.build_category
    end

    def create
      #binding.pry
      @program = Program.new(program_params)
      @program.creator_id = current_user.id
      @program.category_id = @category.id

        if @program.save
          redirect_to program_path(@program)
        else
          render :new
        end
    end

    def edit
    end

    def update
      binding.pry
      @program.update(program_params)

      redirect_to program_path(@program)
    end

    def show
    end

    def destroy
      #binding.pry
      @program.destroy!
      redirect_to programs_path
    end

    private

    def set_program
      @program = Program.find(params[:id])
    end

    def get_category
      @category = Category.find_by(id: params[:program][:category_id])
      if @category.nil?
        @category = Category.create(name: params[:program][:category_attributes][:name])
      end
    end

    def program_params
      params.require(:program).permit(:name, :website, :description, category_attributes: [:name])
    end

end

