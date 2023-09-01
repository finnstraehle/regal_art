class EventAttendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, presence: true
  validates :event, presence: true

  MESSAGES = [
    "Hello! I would like to make a reservation for two at your art gallery on Wednesday.",
    "Hi there! I'm interested in reserving a spot for myself and a guest to visit your art gallery. Can you please confirm availability?",
    "Good day! I'd like to secure a reservation to explore your art gallery. Could you please let me know if that's possible?"
  ]
end
