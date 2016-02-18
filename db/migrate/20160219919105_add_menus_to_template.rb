class AddMenusToTemplate < ActiveRecord::Migration
  def change
    add_reference :templates, :menu, index: true
  end
end
