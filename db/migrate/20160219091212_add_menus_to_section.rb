class AddMenusToSection < ActiveRecord::Migration
  def change
    add_reference :sections, :menu, index: true
  end
end
