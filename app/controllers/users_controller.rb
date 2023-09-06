class UsersController < ApplicationController
  def discover
    @title = "Discover"
    @banner = "user3_avatar.jpg"
    @artists = User.where(is_artist: true).shuffle
  end

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
    @hide_artist_buttons = true if current_user.is_artist?
  end

  def preferences
    @hide_nav_footer = true
    @preference = Preference.new
  end
end
