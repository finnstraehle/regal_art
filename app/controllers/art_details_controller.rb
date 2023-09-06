class ArtDetailsController < ApplicationController
  def create
    @canvas = Artwork.find(params[:art_detail][:artwork_id])
    @art_detail = ArtDetail.new(art_detail_params)
    @art_detail.save!
    redirect_to edit_artwork_path(@canvas)
  end

  private

  def art_detail_params
    params.require(:art_detail).permit(:artwork_id, :title, :description)
  end
end
