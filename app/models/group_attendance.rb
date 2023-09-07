class GroupAttendance < ApplicationRecord
  belongs_to :user
  belongs_to :subscriber_group
end
