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

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to edit_portfolio_path
  end

  def preferences
    @hide_nav_footer = true
    # @user = User.find(params[:id])
    @preference = Preference.new
  end

  def delete_banner
    @banner = ActiveStorage::Attachment.find(params[:id])
    @banner.purge
    redirect_to banners_path
  end

  def add_banner
    raise
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :short_bio, :long_bio, :avatar)
  end
end
