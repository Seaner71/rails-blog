class CommentsController < ApplicationController
  def create
    @comment = Comment.new
  end
  def destroy
    @comment.destroy
    redirect_to posts_path
  end
end
