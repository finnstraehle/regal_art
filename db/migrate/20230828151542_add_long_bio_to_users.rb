class AddLongBioToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :long_bio, :text
  end
end
