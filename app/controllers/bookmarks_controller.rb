class BookmarksController < ApplicationController

 def index
    @bookmarks = current_user.bookmarks
 end

 def new
 end

 def create
    @bookmark = Bookmark.new
    @bookmark.program_id = params[:program_id]
    @bookmark.user_id = current_user.id
    @bookmark.date_saved = Date.today
    
    @bookmark.save
    redirect_to category_program_path(@bookmark.program.category, @bookmark.program)
 end

 def destroy
   set_bookmark
   get_program
   
   @bookmark.destroy
   redirect_to category_program_path(@program.category, @program)
 end

 private

 def set_bookmark
   @bookmark = current_user.bookmarks.find(params[:id])
 end
 
 def get_program
  @program = Program.find_by_id(@bookmark.program_id)
 end
end