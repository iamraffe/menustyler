class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :subcategory_memberships
  has_many :items, :through => :subcategory_memberships

  liquid_methods :items, :name
end
