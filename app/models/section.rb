class Section < ActiveRecord::Base
  belongs_to :menu
  has_many :categories
  liquid_methods :categories, :position
end
