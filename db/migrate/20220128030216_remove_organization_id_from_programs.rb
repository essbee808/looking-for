class RemoveOrganizationIdFromPrograms < ActiveRecord::Migration[6.1]
  def change
    remove_column :programs, :organization_id
  end
end
