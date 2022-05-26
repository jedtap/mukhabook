class FriendshipsController < ApplicationController

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

  # def destroy
  # end



end