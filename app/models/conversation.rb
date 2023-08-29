class Conversation < ApplicationRecord
  belongs_to :buyer, class_name: 'User'
  belongs_to :artist, class_name: 'User'
  has_many :messages, dependent: :destroy

  validates :buyer, presence: true
  validates :artist, presence: true
end
