# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

Shelf.delete_all

[:aman, :lowell, :akshay, :chang].each { |user|
  user_name = user.to_s
  new_user = User.new
  new_user.email = "%s@%s.com" % [user_name, user_name]
  new_user.password = "%s%s" % [user_name, user_name]
  new_user.password_confirmation = "%s%s" % [user_name, user_name]
  new_user.save!

  new_shelf = Shelf.new
  new_shelf.shelf_name = "%s's shelf" % user_name
  new_shelf.shelf_owner = new_user.id
  new_shelf.save!
}



