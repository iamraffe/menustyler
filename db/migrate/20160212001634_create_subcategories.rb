class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.integer :position
      t.timestamps null: false
    end
  end
end
