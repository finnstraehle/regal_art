class UsersController < ApplicationController
  def index
    @artists = User.where(is_artist: true)
  end

  def show
    @artist = User.find(params[:id])
  end
end
