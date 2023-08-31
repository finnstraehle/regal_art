class ArtworksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :home]

  def index
    @title = "Artworks"
    @artworks = Artwork.all
  end
end
