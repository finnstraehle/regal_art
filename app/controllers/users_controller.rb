class UsersController < ApplicationController
  def index
    @artists = User.where(is_artist: true)
    @title = "Find Artists"
    @banner = "user1_avatar.jpg"
  end

  def show
    @artist = User.find(params[:id])
    @title = "#{@artist.first_name} #{@artist.last_name}"
    @banner = "user1_avatar.jpg"
  end
end
