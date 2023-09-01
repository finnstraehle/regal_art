class AddAttendeesToEventAttendances < ActiveRecord::Migration[7.0]
  def change
    add_column :event_attendances, :attendees, :integer
  end
end
