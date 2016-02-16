class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :items

  liquid_methods :items, :name
end
