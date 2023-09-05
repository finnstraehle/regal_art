class ArtworksController < ApplicationController
  def index
    @artworks = current_user.artworks.where(has_details: false)
    @title = "My Artworks"
  end

  def canvas
    @canvas = current_user.artworks.where(has_details: true)
    @title = "My Canvas"
  end

  def banners
    @banners = current_user.banners
    @title = "My Banners"
  end

  def new
    @artwork = Artwork.new
    @title = "New Artwork"
  end

  def create
    @artwork = Artwork.new(params[:artwork])
    @artwork.user = current_user
    @artwork.has_details = false
    @artwork.save
  end

  def new_canvas
    @canvas = Artwork.new
    @title = "New Canvas"
  end

  def create_canvas
    @canvas = Artwork.new(params[:canvas])
    @canvas.user = current_user
    @canvas.has_details = true
    @canvas.save
  end

  def create_banner
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :description, :photo)
  end

  def canvas_params
    params.require(:canvas).permit(:title, :description, :photo)
  end
end
