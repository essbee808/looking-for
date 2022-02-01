class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
  end

  def create
  end

  private

  def category_params
    params.require(:category).permit(:name, :program_ids => [])
  end

end
