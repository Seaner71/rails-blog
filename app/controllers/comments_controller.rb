class CommentsController < ApplicationController
  def new
      @comment = Comment.new
  end
  def index
    @comments = Comment.all
    @user = User.all
    @current_user = User.find_by_id(session[:user_id])
  end
  def create
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to posts_path
    end
  end

  def destroy
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.find_by_id(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
