class Item < ActiveRecord::Base
  belongs_to :subcategory
  belongs_to :category
  liquid_methods :text
end
