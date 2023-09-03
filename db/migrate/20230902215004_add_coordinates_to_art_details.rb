class AddCoordinatesToArtDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :art_details, :x_value, :integer
    add_column :art_details, :y_value, :integer
  end
end
