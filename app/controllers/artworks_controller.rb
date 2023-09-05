class ArtworksController < ApplicationController
  def index
    @artworks = current_user.artworks.where(has_details: false)
    @title = "My Artworks"
  end

  def canvas
    @canvas = current_user.artworks.where(has_details: true)
    @title = "My Canvas"
  end
end
