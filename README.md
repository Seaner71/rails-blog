# README

## Blog application built using rails 

* Ruby Version 2.3.3
* Rails Version 5.1.4

### Apllication similar to tumblr, a user can create a blog post and comment on other blog posts

- uses 3 models *User* *Post* and *Comment* 
- allows you to create a user, that user can then create a post and comment on their own or other users posts
- DB Schema

```
ActiveRecord::Schema.define(version: 20171124184111) do

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
    t.integer "user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "email"
  end

end
```

Run on your computer:

From your project folder, clone the git repository:

    git clone https://github.com/Seaner71/rails-blog.git

Open the project folder:

    cd rails-blog
  
Install all dependencies:

    bundle install
  
Create the database:

    rake db:migrate

Run the application:

    rails server

To see the application in action, open a browser window and navigate to http://localhost:3000.

