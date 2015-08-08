# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
landlord = Landlord.create(name: 'Sean', email: 'me@seansellek.com', password: 'asdfghjk', password_confirmation: 'asdfghjk')
property = Property.create(landlord_id: landlord.id, name: 'Beach home')


