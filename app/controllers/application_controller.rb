class ApplicationController < ActionController::Base
    helper_method :created_categories

    # def created_categories
    #     @categories = []
    #     @categories_array = [
    #         'Hygiene', 
    #         'Health', 
    #         'Money Management', 
    #         'Transportation', 
    #         'Education', 
    #         'Employment', 
    #         'Nutrition']
    #     @categories_array.each do |t|
    #         new_category = Category.create(name: t)
            
    #         @categories << new_category
    #     end
    #     @categories
    # end
end
