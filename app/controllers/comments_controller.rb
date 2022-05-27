class CommentsController < ApplicationController
  def index
    
  end

  def create
    @comment = current_user.profile.posts.first.comments.build(comment_params)
    @comment.save
    redirect_back(fallback_location:"/")
  end

  private

  def comment_params
    params.require(:comment).permit(:profile_id, :post_id, :body)
  end

end