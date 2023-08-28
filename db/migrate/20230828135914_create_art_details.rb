class CreateArtDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :art_details do |t|
      t.references :artwork, null: false, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
