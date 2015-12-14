# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(name: "Phuong", email: "phuong@gmail.com", password: "phuong@gmail.com", password_confirmation: "phuong@gmail.com")
u2 = User.create(name: "Hao", email: "hao@gmail.com", password: "hao@gmail.com", password_confirmation: "hao@gmail.com")
u3 = User.create(name: "Thien", email: "thien@gmail.com", password: "thien@gmail.com", password_confirmation: "thien@gmail.com")

Relationship.create(from: u1, to: u2, new_message: true)
Relationship.create(from: u1, to: u3, new_message: true)

Message.create(sender: u1, receiver: u2, body: "Phuong to Hao", read: false)
Message.create(sender: u1, receiver: u3, body: "Phuong to Thien", read: false)

