class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home] # think about this, but I think it's only :home

  def home
    @hide_nav_footer = true
  end

  def dashboard
    @title = "Dashboard"
  end

  def artist_dashboard
    @title = "Dashboard"
  end

  def discover
    @title = "Discover"
    @banner = "user3_avatar.jpg"
    @artists = User.where(is_artist: true).shuffle
  end

  def analytics
    @title = "Analytics"
  end

  def subscribers
    @title = "Subscribers"
    @received_subscriptions = current_user.received_subscriptions
  end

  def edit_portfolio
    @artist = current_user
    @title = "Edit Portfolio"
  end
end
