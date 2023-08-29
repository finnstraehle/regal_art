class Preference < ApplicationRecord
  belongs_to :user

  validates :style, presence: true
  validates :user, presence: true
end
