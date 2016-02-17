class SubcategoryMembership < ActiveRecord::Base
  belongs_to :item
  belongs_to :subcategory
end
