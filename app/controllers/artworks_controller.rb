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
    @title = "New Canvas"
  end

  def edit
    @artwork = Artwork.find(params[:id])
    @title = "Edit Artwork"
  end

  def edit_canvas
    @canvas = Artwork.find(params[:id])
    @title = "Edit Canvas"
  end

  def update
    @artwork = Artwork.find(params[:id])
    @artwork.update(artwork_params)
    redirect_to artworks_path if @artwork.has_details == false
    redirect_to canvas_path if @artwork.has_details == true
  end

  def create
    @artwork = Artwork.new(params[:artwork])
    @artwork.user = current_user
    @artwork.has_details = false
    @artwork.save
  end

  def create_canvas
    @canvas = Artwork.new(params[:canvas])
    @canvas.user = current_user
    @canvas.has_details = true
    @canvas.save
  end

  def create_banner
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    redirect_to artworks_path
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :description, :style, :photo)
  end

  def canvas_params
    params.require(:artwork).permit(:title, :description, :style, :photo)
  end
end
