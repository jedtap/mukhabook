class FriendshipsController < ApplicationController

  def index
    @fri = Friendship.where(user_id: current_user.id).where(confirmed: 0)
    @fri_inv = Friendship.where(friend_id: current_user.id).where(confirmed: 0)
  end

  def create
    @fri = current_user.friendships.build
    @fri.friend_id = params[:friend_id]
    @fri.confirmed = 0

    if @fri.save
      flash[:notice] = "Friend request sent!"
    else
      flash[:notice] = "Some errors!"
    end

    redirect_back(fallback_location:"/")
  end

  def update
    @fri_inv = Friendship.where(user_id: params[:id]).where(friend_id: current_user.id).first
    @fri_inv.confirmed = 1
    @fri_inv.save

    flash[:notice] = "Friend request accepted!"
    redirect_back(fallback_location:"/")
  end

  def destroy
    @fri = Friendship.where(user_id: current_user.id).where(friend_id: params[:id])
    @fri_inv = Friendship.where(user_id: params[:id]).where(friend_id: current_user.id)
    
    @fri.delete_all
    @fri_inv.delete_all

    flash[:notice] = "Unfriend done."
    redirect_back(fallback_location:"/")
  end

end
