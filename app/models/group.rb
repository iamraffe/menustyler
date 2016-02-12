class Group < ActiveRecord::Base
  validates_format_of :name, with: /\A([^@\s]+)/, message: "must be lowercase alphanumerics only"
  validates_length_of :name, maximum: 32, message: "exceeds maximum of 32 characters"
  validates_exclusion_of :name, in: ['www', 'mail', 'ftp'], message: "is not available"
  validates :subdomain, uniqueness: true
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :menus
end
