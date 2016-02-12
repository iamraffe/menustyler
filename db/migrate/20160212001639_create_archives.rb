class CreateArchives < ActiveRecord::Migration
  def change
    create_table :archives do |t|
      t.text :content
      t.string :name
      t.timestamps null: false
    end
  end
end
