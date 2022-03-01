class CategoriesController < ApplicationController
  before_action :set_category, except: [:index, :new, :create]
  before_action :valid_category, only: [:show, :edit]
  before_action :is_admin, except: [:index, :show]

  def index
    @categories = Category.all.ordered_by_name
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
    @programs = @category.programs.ordered_by_name
  end

  def edit
  end

  def update
    @category.update(category_params)
    redirect_to category_path
  end

  def destroy
      @category.programs.each do |p|
        p.user_programs.destroy_all
      end
    @category.destroy!
    redirect_to categories_path
  end

  private

  def is_admin
    if !current_user.admin
      redirect_to categories_path
    end
  end

  def set_category
    @category = Category.find_by(id: params[:id])
  end

  def valid_category
    if !set_category
      redirect_to categories_path
    end
  end

  def category_params
    params.require(:category).permit(:name, :program_ids => [])
  end

end
