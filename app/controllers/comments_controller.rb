class CommentsController < ApplicationController
  def create
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find_by_id(params[:post_id]
    @comment = @post.comments.find_by_id(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
