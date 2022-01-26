class ProgramsController < ApplicationController
    def index
        @programs = Program.all
    end

    def new
    end

    def create
        @program = Program.new(program_params)
        binding.pry
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def program_params
        params.require(:program).permit(:name, :description, :website)
    end
end

