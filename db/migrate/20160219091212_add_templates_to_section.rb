class AddTemplatesToSection < ActiveRecord::Migration
  def change
    add_reference :sections, :template, index: true
  end
end
