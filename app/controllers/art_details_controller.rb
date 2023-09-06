class ArtDetailsController < ApplicationController
  def create
    @art_detail = ArtDetail.new(art_detail_params)
    @art_detail.artwork = Artwork.find(params[:artwork_id])
    @art_detail.save
    redirect_to edit_artwork_path(@art_detail.artwork)
  end

  private

  def art_detail_params
    params.require(:art_detail).permit(:artwork_id, :title, :description, :x_value, :y_value)
  end
end
