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
  validates :location, if: :is_artist?, presence: true
  validates :short_bio, if: :is_artist?, presence: true
  validates :long_bio, if: :is_artist?, presence: true

  has_one_attached :avatar
  has_many_attached :banners
end
