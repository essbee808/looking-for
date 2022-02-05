class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    #binding.pry
    @category = Category.find_by(id: params[:id])
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :program_ids => [])
  end

end
