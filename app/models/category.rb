class Category < ActiveRecord::Base
  has_many :category_memberships
  has_many :items, :through => :category_memberships
  has_many :subcategories
  belongs_to :section
  liquid_methods :subcategories, :items, :name
end
