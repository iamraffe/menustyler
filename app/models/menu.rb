class Menu < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :group
  has_many :categories

  liquid_methods :categories,  :name
end
