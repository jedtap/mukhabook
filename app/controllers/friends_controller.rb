class FriendsController < ApplicationController
  def index
    @profiles = Profile.all.shuffle
    # @profile = Profile.find(params[:id])
  end
end
