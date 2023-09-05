class AddDefaultValueToIsArtist < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :is_artist, :boolean, default: false
  end
end
