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
    @artist = current_user
    @banners = current_user.banners
    @title = "My Banners"
  end

  def new
    @artwork = Artwork.new
    @title = "New Artwork"
  end

  def new_canvas
    @canvas = Artwork.new
    @canvas.has_details = true
    @title = "New Canvas"
  end

  def edit
    @artwork = Artwork.find(params[:id])
    @title = @artwork.has_details? ? "Edit Canvas" : "Edit Artwork"
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artwork.update(artwork_params)
    redirect_to @artwork.has_details? ? canvas_path : artworks_path
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.user = current_user
    @artwork.save!
    redirect_to @artwork.has_details? ? edit_artwork_path(@artwork) : artworks_path
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to artworks_path
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :description, :style, :has_details, :photo)
  end
end
