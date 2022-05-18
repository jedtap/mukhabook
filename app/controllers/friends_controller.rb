class FriendsController < ApplicationController
  def index
    @profiles = Profile.all.shuffle
  end
end
