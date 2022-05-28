class CommentsController < ApplicationController
  def index
    
  end

  def create
    @comment = Comment.new(body: params[:body], profile_id: params[:profile_id], post_id: params[:post_id] ).save
    # redirect_back(fallback_location:"/")
    redirect_to url:"/posts##{params[:post_id]}"
  end

end