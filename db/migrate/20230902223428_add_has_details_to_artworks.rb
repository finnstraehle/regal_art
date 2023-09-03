class AddHasDetailsToArtworks < ActiveRecord::Migration[7.0]
  def change
    add_column :artworks, :has_details, :boolean
  end
end
