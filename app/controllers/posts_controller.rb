class PostsController < ApplicationController
  before_action :get_post, only:[:show, :destroy]
  def new
    @posts = Post.all
  end

  def show
  end
  def destroy
    @post.destroy
    redirect_to users_path
  end
  private

  def get_post
    @post = Post.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:title)

  end
end
