class Artwork < ApplicationRecord
  belongs_to :user
  has_many :art_details, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :user, presence: true
  validates :has_details, inclusion: { in: [true, false] }

  has_one_attached :photo
  has_many_attached :details_photos # probably remove this (move to artdetails)

  STYLES = ['Painting', 'Sculpture'] # add more

  TITLES = [
    "Ethereal Dreams",
    "Aurora's Embrace",
    "Serenade in Blue",
    "Whispers of Twilight",
    "Abstract Reverie",
    "Crimson Cascade",
    "Dance of the Fireflies",
    "Reflections of Solitude",
    "Emerald Enchantment",
    "Infinite Horizons",
    "Sunset Sonata",
    "Mystic Waters",
    "Harmony of Chaos",
    "Tranquil Whispers",
    "Urban Mirage",
    "Celestial Harmony",
    "Enchanted Forest",
    "Midnight Serenity",
    "Sapphire Secrets",
    "Journey to Elysium",
    "Aetherial Allure",
    "Echoes of the Cosmos",
    "Rhapsody in Red",
    "Whispers in the Wind",
    "Emerging Hues",
    "Melodies of the Mind",
    "Aqua Dreamscape",
    "Crimson Reverie",
    "Silent Solitude",
    "Tranquil Echoes",
    "Azure Dreams",
    "Luminous Overture",
    "Gossamer Shadows",
    "Rhapsody in Purple",
    "Enchanted Evening",
    "Harmony of Colors",
    "Cerulean Dreams",
    "Nebula's Embrace",
    "Whispers of Dawn",
    "Mystic Voyage",
    "Dreams of Dusk",
  ]

  DESCRIPTIONS = [
    "This exquisite painting captures a serene lakeside scene at dawn, with the gentle ripples of the water reflecting the soft hues of the rising sun.",
    "A mesmerizing abstract composition that invites viewers to lose themselves in a sea of vibrant colors and intricate patterns.",
    "In this stunning landscape, the artist skillfully portrays the rugged grandeur of a mountain range under a dramatic, cloud-filled sky.",
    "A surreal masterpiece that transports the observer to a dreamlike realm, where reality and fantasy coalesce in a vivid, imaginative landscape.",
    "Vivid and daring, this painting's bold use of crimson and deep blues creates a visceral sense of passion and intensity.",
    "An intimate portrayal of a single red rose, its delicate petals seeming to glow with an inner luminance against a dark background.",
    "A thought-provoking artwork that challenges the viewer's perceptions, encouraging introspection and contemplation.",
    "Energetic and dynamic, this canvas pulsates with life, its riotous mix of colors and shapes exuding boundless creativity.",
    "Step into a realm of enchantment with this ethereal dreamscape, where reality blurs and the imagination takes flight.",
    "A captivating portrayal of a celestial dance, as the moon and sun appear to waltz across the canvas, casting a mesmerizing spell.",
    "This contemplative piece invites viewers to ponder the complexities of existence, with its intricate details and symbolic elements.",
    "Geometry and aesthetics converge in a mesmerizing display of balance and precision, creating a harmonious visual experience.",
    "Minimalism at its finest, this painting employs clean lines and subtle shades to convey simplicity and sophistication.",
    "A whirlwind of vibrant colors and swirling forms infuses this canvas with a sense of dynamism and vitality.",
    "Journey through time with this artwork, which weaves together moments from history into a beautifully intricate tapestry.",
    "Explore the enchanting underwater world in this whimsical composition, where marine life thrives amidst a vivid coral reef.",
    "This portrait is a profound study of the human soul, capturing the subject's innermost thoughts and emotions.",
    "In this surreal landscape, reality blurs as dreamlike elements coalesce, inviting viewers into a world of wonder and curiosity.",
    "The interplay of light and shadow creates a sense of drama and depth in this captivating study of contrasts.",
    "An intimate still life composition that imbues ordinary objects with newfound significance and poetic beauty."
  ]
end
