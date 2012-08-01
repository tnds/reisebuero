# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create(name: 'Admin')
Role.create(name: 'User')
Role.create(name: 'Moderator')
User.create(username: 'admin', password: 'password',password_confirmation: 'password' , email: 'reisebuero@piraten-nds.de', role_id: 1)
