class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.profile_id = params[:profile_id]
    @like.post_id = params[:post_id]
    @like.save
    redirect_back(fallback_location:"/")
  end

  def destroy
    Like.where(profile_id: current_user.profile.id).where(post_id: params[:id]).delete_all
    redirect_back(fallback_location:"/")
  end
end
