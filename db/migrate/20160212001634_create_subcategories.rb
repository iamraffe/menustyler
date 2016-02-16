class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name
      t.integer :position
      # t.references :subcategory, index: true
      t.timestamps null: false
    end
  end
end
