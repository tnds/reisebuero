# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Role.create(name: 'Admin')
role = Role.create(name: 'User')
moderator = Role.create(name: 'Moderator')
User.create(username: 'admin', password: 'password',password_confirmation: 'password' , email: 'reisebuero@piraten-nds.de', role_id: admin.id)
Contacttype.create(name: 'email')
Contacttype.create(name: 'twitter')
Contacttype.create(name: 'mobilephone')
Contacttype.create(name: 'phone')
Contacttype.create(name: 'jabber')
