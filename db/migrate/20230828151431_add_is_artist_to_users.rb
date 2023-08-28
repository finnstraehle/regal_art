class AddIsArtistToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_artist, :boolean
  end
end
