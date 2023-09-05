class ArtworksController < ApplicationController
  def index
    @artworks = current_user.artworks
    @title = "My Artworks"
  end

  def canvas
    @canvas = current_user.artworks.where(has_details: true)
  end
end
