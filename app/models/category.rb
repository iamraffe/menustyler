class Category < ActiveRecord::Base
  belongs_to :menu
  has_many :items
  has_many :subcategories
  liquid_methods :subcategories, :items, :name
end
