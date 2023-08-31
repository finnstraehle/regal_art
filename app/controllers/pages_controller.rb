class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home] # think about this, but I think it's only :home

  def home
    @title = "Recommended artists"
    @user = "" # remove once login stuff works
    @user = current_user.last_name unless current_user.nil?
    @banner = "user1_avatar.jpg"
    @hide_nav_footer = true
  end

  def dashboard
    @banner = "user1_avatar.jpg"
  end

  def discover
    @title = "Discover"
    @banner = "user3_avatar.jpg"
    @artists = User.where(is_artist: true).shuffle
  end
end
