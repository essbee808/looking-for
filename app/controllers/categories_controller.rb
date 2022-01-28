class CategoriesController < ApplicationController
  def index
    @categories = [
      'Hygiene', 
      'Health', 
      'Money Management', 
      'Transportation', 
      'Education', 
      'Employment', 
      'Nutrition']
    
  end

end
