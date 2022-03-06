class AddOrganizationToPrograms < ActiveRecord::Migration[6.1]
  def change
    add_column :programs, :organization, :string
  end
end
