class CreateSubcategoryMemberships < ActiveRecord::Migration
  def change
    create_table :subcategory_memberships do |t|
      t.integer :item_id
      t.integer :subcategory_id
      t.timestamps null: false
    end
    add_index :subcategory_memberships, :item_id
    add_index :subcategory_memberships, :subcategory_id
  end
end
