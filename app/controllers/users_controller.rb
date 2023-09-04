class UsersController < ApplicationController
  def index
    @artists = User.where(is_artist: true)
    @title = "Find Artists"
    @banner = "user1_avatar.jpg"
  end

  def show
    @artist = User.find(params[:id])
    @subscription = Subscription.find_by(buyer: current_user, artist: @artist)
    @conversation = Conversation.find_by(buyer: current_user, artist: @artist)
    @banner = @artist.banners
    @hide_artist_buttons = true if current_user == @artist
  end
end
