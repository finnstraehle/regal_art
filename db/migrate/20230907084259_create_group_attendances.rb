class CreateGroupAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :group_attendances do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subscriber_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
