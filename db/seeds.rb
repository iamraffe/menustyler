# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Group.destroy_all

@due = Group.create! name: 'Bufalina Due', subdomain: 'bufalinadue', email: 'bufalinapizza.com'

User.destroy_all

@m =User.create! name: 'Michu Benaim', email: 'michu@weareinhouse.com', :password => 'topsecret', :password_confirmation => 'topsecret', username: 'michu'

@due.users << @m

Menu.destroy_all

Menu.create! name: 'Wine list',  group_id: @due.id
