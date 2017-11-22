# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

User.create(username: "Sean")
Post.create(title: 'Hello World', content: "lorem ipsum fasdfsadhffhdsajhfdsjhfsdajhfjdas")
# Comment.create(text: "what u talking about?", post_id: 1, user_id: 1)

User.create(username: "Frank")
Post.create(title: 'Regexp', content: "why Regexp are a difficult concept to get your head around")
# Comment.create(text: "i agree", post_id: 2, user_id: 2)

user_3 = User.create(username: 'test')
post_3 = user_3.posts.create(title: 'test title', content: 'test content')
comment_3 = post_3.comments.create(text: 'test comment')
