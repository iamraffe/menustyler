class Item < ActiveRecord::Base
  has_many :category_memberships
  has_many :categories, :through => :category_memberships
  has_many :subcategory_memberships
  has_many :subcategories, :through => :subcategory_memberships
  liquid_methods :text
end
