class RenameUserPrograms < ActiveRecord::Migration[6.1]
  def change
    rename_table :user_programs, :bookmarks
  end
end
