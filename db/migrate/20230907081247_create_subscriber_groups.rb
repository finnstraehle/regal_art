class CreateSubscriberGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriber_groups do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
