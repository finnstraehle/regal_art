class UsersController < ApplicationController
  def index
    @artists = User.where(is_artist: true)
    @title = "Find Artists"
  end

  def show
    @artist = User.find(params[:id])
    @title = "#{@artist.first_name} #{@artist.last_name}"
  end
end
