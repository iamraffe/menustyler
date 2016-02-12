class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :slug
      t.string :avatar
      t.timestamps null: false
    end
  end
end
