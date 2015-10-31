# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

aman = User.new
aman.email = "aman@aman.com"
aman.password = "amanaman"
aman.password_confirmation = "amanaman"
aman.save!

lowell = User.new
lowell.email = "lowell@lowell.com"
lowell.password = "lowelllowell"
lowell.password_confirmation = "lowelllowell"
lowell.save!

akshay = User.new
akshay.email = "akshay@akshay.com"
akshay.password = "akshayakshay"
akshay.password_confirmation = "akshayakshay"
akshay.save!

chang = User.new
chang.email = "chang@chang.com"
chang.password = "changchang"
chang.password_confirmation = "changchang"
chang.save!

