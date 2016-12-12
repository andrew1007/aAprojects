# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "chloe", password: "password")
User.create(username: "andrew", password: "password")
User.create(username: "preston", password: "password")
User.create(username: "raymond the nerd", password: "password")

Sub.create!(title: "dogs", user_id: 1)
Sub.create!(title: "cats", user_id: 1)
Sub.create!(title: "bird", user_id: 2)
Sub.create!(title: "fish", user_id: 3)
Sub.create!(title: "raymond fan club", user_id: 2)
Sub.create!(title: "rats", user_id: 4)
Sub.create!(title: "tiger", user_id: 3)
Sub.create!(title: "lion", user_id: 1)

Post.create!(title: "raymond is cool", url: "asdf", user_id: 1)
Post.create!(title: "raymond is cool", url: "asdf", user_id: 1)
Post.create!(title: "raymond is cool", url: "asdf", user_id: 2)
Post.create!(title: "raymond is cool", url: "asdf", user_id: 1)
Post.create!(title: "raymond is cool", url: "asdf", user_id: 2)

PostSub.create!(sub_id: 1, post_id: 1)
PostSub.create!(sub_id: 1, post_id: 2)
PostSub.create!(sub_id: 2, post_id: 1)
PostSub.create!(sub_id: 3, post_id: 1)
