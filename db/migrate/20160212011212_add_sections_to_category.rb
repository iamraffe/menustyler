class AddSectionsToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :section, index: true
  end
end
