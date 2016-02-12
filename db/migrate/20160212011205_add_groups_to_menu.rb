class AddGroupsToMenu < ActiveRecord::Migration
  def change
    add_reference :menus, :group, index: true
  end
end
