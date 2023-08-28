class AddShortBioToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :short_bio, :text
  end
end
