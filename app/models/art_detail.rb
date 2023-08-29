class ArtDetail < ApplicationRecord
  belongs_to :artwork

  validates :artwork, presence: true
  validates :title, presence: true
  validates :description, presence: true
end
