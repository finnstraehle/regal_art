class Event < ApplicationRecord
  belongs_to :user
  has_many :event_attendances, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true

  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
