class Template < ActiveRecord::Base
  has_many :sections
  belongs_to :menu
  liquid_methods :sections
end
