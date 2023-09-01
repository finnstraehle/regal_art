class AddMessageToEventAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :event_attendances, :message, :text
  end
end
