class CreateCategoryMemberships < ActiveRecord::Migration
  def change
    create_table :category_memberships do |t|
      t.integer :item_id
      t.integer :category_id
      t.timestamps null: false
    end
    add_index :category_memberships, :item_id
    add_index :category_memberships, :category_id
  end
end
