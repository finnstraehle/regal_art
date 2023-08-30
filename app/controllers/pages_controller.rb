class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home] # think about this, but I think it's only :home

  def home
    @title = "Recommended artists"
  end

  def dashboard
  end

  def discover
    @artists = User.where(is_artist: true)
  end
end
