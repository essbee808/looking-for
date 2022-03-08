class AddDateSavedToUserPrograms < ActiveRecord::Migration[6.1]
  def change
    add_column :user_programs, :date_saved, :datetime
  end
end
