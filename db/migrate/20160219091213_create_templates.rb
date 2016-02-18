class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.text :description
      t.text :structure
      t.timestamps null: false
    end
  end
end
