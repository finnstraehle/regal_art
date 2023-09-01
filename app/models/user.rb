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

  SHORT_BIOS = [
    "Exploring the world through colors and shapes.",
    "Creating art that speaks to the soul.",
    "Expressing emotions on canvas, one stroke at a time.",
    "Pushing the boundaries of creativity to inspire.",
    "Transforming ideas into visual masterpieces."
  ]


  LONG_BIOS = [
    "I am an accomplished and internationally recognized artist with a lifelong commitment to exploring the profound depths of human emotion through my work. Over the course of my career, I have received numerous awards and accolades for my contributions to the art world. My paintings are a reflection of the intricate tapestry of life's complexities, where I meticulously layer colors and textures to convey a myriad of emotions and experiences. Each piece is a visual narrative, often juxtaposing light and dark, inviting viewers to delve into the rich and intricate stories I weave onto the canvas. My art seeks to provoke thought and spark dialogue about the human condition, inviting viewers to connect with their own emotions and experiences on a deeply personal level.",
    "As an artist, I find endless inspiration in the natural world that surrounds us. Nature's beauty and serenity serve as a constant muse for my creative endeavors. With a deep appreciation for landscapes and wildlife, I strive to capture the essence of these wonders in my art. Through my brush strokes and color palettes, I aim to convey not only the visual splendor of the world but also the emotional resonance it elicits within me. My goal is to share this sense of wonder and awe with the world, inviting viewers to connect with the natural world and its boundless beauty through my creations.",
    "My artistic journey is a fusion of classical traditions and avant-garde concepts. With a rich cultural heritage and a deep appreciation for the arts, I draw from centuries of artistic wisdom while infusing my work with modern and contemporary ideas. The result is a body of work that is both rooted in tradition and pushing the boundaries of what art can be. I seek to challenge conventional norms and provoke thought, using my art as a vehicle for social commentary and cultural exploration. My pieces often invite viewers to question their assumptions, inviting them to engage in a dialogue about the ever-evolving world of art and its role in our lives.",
    "With a background in architecture, my art is marked by geometric precision and an exploration of spatial relationships. My fascination lies in the interplay of shapes, colors, and forms within a given space. I use my art to invite viewers to reconsider their perception of the physical world around them. My compositions are carefully crafted to evoke a sense of harmony and balance, drawing from the principles of architectural design. Each piece is a testament to my passion for creating art that challenges the viewer's spatial awareness and invites them to explore the intricate dance between geometry and aesthetics.",
    "I am a versatile multimedia artist who thrives on the boundless possibilities of creative experimentation. My portfolio encompasses a wide range of mediums, from traditional painting and sculpture to cutting-edge digital art and immersive mixed-media installations. My work is a testament to my commitment to pushing the boundaries of what art can be and how it can engage with its audience. I believe that art is a dynamic and evolving force that transcends traditional categorizations, and I invite viewers to journey with me through the ever-expanding landscape of artistic expression."
  ]
end
