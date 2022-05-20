class FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @profiles = Profile.where.not(id: current_user.profile.id).shuffle
  end
end
