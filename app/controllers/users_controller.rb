class UsersController < ApplicationController
  def index
    @artists = User.where(is_artist: true)
    @title = "Find Artists"
    @banner = "user1_avatar.jpg"
  end

  def show
    @artist = User.find(params[:id])
    @subscription = Subscription.new
    @title = "#{@artist.first_name} #{@artist.last_name}"
    @banner = @artist.banners
    @hide_artist_buttons = true if current_user == @artist
  end
end
