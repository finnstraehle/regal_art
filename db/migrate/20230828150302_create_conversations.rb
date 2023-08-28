class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.references :buyer, null: false
      t.references :artist, null: false

      t.timestamps
    end
  end
end
