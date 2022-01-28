class DestroyOrganizations < ActiveRecord::Migration[6.1]
  def up
    drop_table :organizations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
