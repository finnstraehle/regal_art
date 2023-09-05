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

  def new_canvas
    @canvas = Artwork.new
    @title = "New Canvas"
  end
end
