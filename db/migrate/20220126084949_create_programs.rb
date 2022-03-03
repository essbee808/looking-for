class CreatePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.string :name
      t.string :website
      t.text :description
      t.integer :category_id
      
      t.timestamps
    end
  end
end
