# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(username: "Sean")
post_1 = user_1.posts.create(title: 'Hello World', content: "lorem ipsum fasdfsadhffhdsajhfdsjhfsdajhfjdas")
comment_1 = post_1.comments.create(name: "what u talking about?")

user_2 = User.create(username: "Frank")
post_2 = user_2.posts.create(title: 'Regexp', content: "why Regexp are a difficult concept to get your head around")
comment_2 = post_2.comments.create(name: "i agree")
