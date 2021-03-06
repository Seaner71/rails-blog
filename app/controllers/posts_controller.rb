class PostsController < ApplicationController
  before_action :get_post, only:[:show, :destroy]
  def new
    @post = Post.new
  end

  def show
    @posts = Post.all
    @current_user = User.find_by_id(session[:user_id])
  end
  def index
    @posts = Post.all
    @current_user = User.find_by_id(session[:user_id]) 
  end
  def create
    # we don't need @ - (user as instance variable) because we only need instance variables when we need to render something in the view.  The point of having an instance variable in any of our controller methods, IS THAT THEY ARE THEN ACCESSIBLE BY OUR VIEW.  IF A VARIABLE IS NOT AN INSTANCE VARIABLE (@) THEN THE VIEW DOES NOT HAVE ACCESS TO THAT VARIABLE.
    user = User.find_by_id(params[:user_id])
    user.posts.create(post_params)
    redirect_to posts_path
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  private

  def get_post
    @post = Post.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)

  end
end
