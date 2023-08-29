class Message < ApplicationRecord
  belongs_to :conversation

  validates :content, presence: true
  validates :conversation, presence: true
end
