class ApplicationController < ActionController::Base

  # def hello_world
  #   #render({inline: '<h1> Hello, hello, lovely world!</h1>'}) 
  #   person=params['name']||'World'
  #   render('hello_world', {locals:{name:person}})
  # end

  def list_posts
    connection = SQLite3::Database.new 'db/development.sqlite3'
    connection.results_as_hash= true
    
    posts = connection.execute("SELECT * FROM posts")

    render 'application/list_posts', locals: {posts:posts}
  end

  def show_post
    connection = SQLite3::Database.new 'db/development.sqlite3'
    connection.results_as_hash= true
    
    post = connection.execute("SELECT * FROM posts where posts.id = ? LIMIT 1", params['id'].first)
    
    render 'application/show_post', locals: {post:post}
  end
end
