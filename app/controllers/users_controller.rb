class UsersController < ApplicationController
  def discover
    @title = "Discover"
    @banner = "user3_avatar.jpg"
    @preferences = Preference.where(user: current_user).pluck(:style)
    if @preferences.empty?
      @artists = User.where(is_artist: true).shuffle
    else
      @artists = User.joins(:artworks).where(artworks: { style: @preferences }).distinct
    end
  end

  def index
    @artists = User.where(is_artist: true)
    @title = "Your Artists"
    @banner = "user1_avatar.jpg"

    if params[:query].present?
      # @artists = @artists.where("first_name ILIKE ?", "%#{params[:query]}%")
      sql_subquery = "first_name ILIKE :query OR last_name ILIKE :query"
      @artists = @artists.where(sql_subquery, query: "%#{params[:query]}%")
    end
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
    @preference = Preference.new
  end

  def delete_banner
    @banner = ActiveStorage::Attachment.find(params[:id])
    @banner.purge
    redirect_to banners_path
  end

  def add_banner
    @artist = current_user
    @banner = params[:user][:banners]
    @artist.banners.attach(@banner)
    redirect_to banners_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :short_bio, :long_bio, :avatar)
  end
end
