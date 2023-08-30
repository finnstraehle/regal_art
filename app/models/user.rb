class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :artworks, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :event_attendances, dependent: :destroy
  has_many :preferences, dependent: :destroy
  has_many :subscriptions, foreign_key: :buyer_id, class_name: 'Subscription', dependent: :destroy
  has_many :received_subscriptions, foreign_key: :artist_id, class_name: 'Subscription', dependent: :destroy
  has_many :conversations, foreign_key: :buyer_id, class_name: 'Conversation', dependent: :destroy
  has_many :received_conversations, foreign_key: :artist_id, class_name: 'Conversation', dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :is_artist, inclusion: { in: [true, false] }

  has_one_attached :avatar
  has_one_attached :banner

  attr_reader :is_artist

  with_options if: :is_artist? do |artist|
    artist.validates :location, presence: true
    artist.validates :short_bio, presence: true
    artist.validates :long_bio, presence: true
  end
end
