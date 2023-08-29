class Artwork < ApplicationRecord
  belongs_to :user
  has_many :art_details, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :user, presence: true

  STYLES = ['Painting', 'Sculpture'] # add more

  has_one_attached :photo
  has_many_attached :details_photos
end
