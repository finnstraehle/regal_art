class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :style

      t.timestamps
    end
  end
end
