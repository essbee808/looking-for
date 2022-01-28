class AddColumnsToPrograms < ActiveRecord::Migration[6.1]
  def change
    rename_column :programs, :user_id, :creator_id
  end
end
