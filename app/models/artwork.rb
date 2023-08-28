class Artwork < ApplicationRecord
  belongs_to :user
  has_many :art_details, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :style, presence: true
  validates :user, presence: true

  STYLES = ['Painting', 'Sculpture'] # add more
end
