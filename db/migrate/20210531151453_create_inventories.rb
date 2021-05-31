class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.references :machine, foreign_key: true
      t.references :snack, foreign_key: true

      t.timestamps 
    end
  end
end
