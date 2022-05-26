class LikesController < ApplicationController
  def create
    @like = current_user.likes.build
    @like.post_id = params[:post_id]
    @like.save
    redirect_back(fallback_location:"/")
  end

  def destroy
    @like = Like.where(profile_id: current_user.profile.id).where(post_id: params[:post_id])
    @like.delete_all
    redirect_back(fallback_location:"/")
  end
end
