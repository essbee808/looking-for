class RenameOrganizerIdInPrograms < ActiveRecord::Migration[6.1]
  def change
    rename_column :programs, :organizer_id, :organization_id
  end
end
