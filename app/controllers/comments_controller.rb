class CommentsController < ApplicationController
  def new
    # render 'posts/show'
  end
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :username, :user_id)
    end
end
