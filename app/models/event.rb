class Event < ApplicationRecord
  belongs_to :user
  has_many :event_attendances, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, presence: true

  has_many_attached :photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  CITIES = [
    "London",
    "Paris",
    "Berlin",
    "Madrid",
    "Rome",
    "Athens",
    "Amsterdam",
    "Vienna",
    "Prague",
    "Budapest",
    "Warsaw",
    "Stockholm",
    "Lisbon",
    "Dublin",
    "Copenhagen",
    "Oslo",
    "Helsinki",
    "Brussels",
    "Zurich",
    "Munich",
    "Barcelona",
    "Milan",
    "Lyon",
    "Edinburgh",
    "Frankfurt",
    "Venice",
    "Krakow",
    "Geneva",
    "Hamburg",
    "Istanbul",
    "Manchester",
    "Seville",
    "Naples",
    "Valencia",
    "Nice",
    "Glasgow",
    "Vienna",
  ]

  TITLES = [
    "Artistic Fusion Fête",
    "Visionary Vanguard",
    "Gallery Noir Chic",
    "Canvas Carnival X",
    "Sculpted Serenity",
    "Mystic Masterpiece Showcase",
    "ChromaVerse Extravaganza",
    "Elevate: The Art Affair",
    "Gallery Glamorama",
    "Creative Renaissance Rendezvous",
    "Immersive Artistry Soirée",
    "Epic Art Elevation",
    "Aesthetic Alchemy Expo",
    "Elysium Easel Experience",
    "Opulent Odyssey of Art",
    "Gallery Genesis Gala",
    "Zenith of Expression",
    "Enigma Envisioned",
    "Artistry Ascension",
    "Ethereal Elegance Unveiled",
    "Vivid Visionaries' Vault",
    "Gallery Glitz & Glam",
    "Nouveau Nocturnal Nexus",
    "Abstract Aura Affair",
    "Neo-Expressionist Nocturne",
    "Apotheosis Artistry",
    "Epic Art Epoch",
    "Chic Canvas Collective",
    "Gallery Gossamer Gala",
    "Avant-Garde Art Assemblage",
    "Radiant Revival of Art",
    "Elysian Art Enchantment",
    "Luminous Legacy of Creativity",
    "Gallery Grit & Grace",
    "Artisan's Apex Assembly",
    "Evoke: The Artistic Escape",
    "Gallery Gamut Gathering",
    "Reverie in Vivid Hues",
    "Artistry Amplified",
    "Opus of Ecstasy",
    "Abstract Axiom Extravaganza",
  ]

  DESCRIPTIONS = [
    "Join us for an evening of art and culture at the Frick Collection. This special event will feature a private tour of the museum's renowned collection of Old Master paintings, sculptures, and decorative arts. You will also enjoy a cocktail reception and a seated dinner, accompanied by live music.
    The tour will be led by a Frick curator, who will share insights into the history and significance of the collection. You will have the opportunity to see some of the museum's most famous works, including Johannes Vermeer's Girl with a Pearl Earring, Peter Paul Ruben The Garden of Love, and Édouard Manet's Luncheon of the Boating Party.
    After the tour, you will enjoy a cocktail reception in the museum's elegant Garden Court. This will be followed by a seated dinner in the Frick Dining Room, which is decorated with original paintings and sculptures. The dinner will be accompanied by live music from a string quartet.
    This is a unique opportunity to experience the Frick Collection in a special way. Tickets are limited, so reserve yours today!",
    "Join us for an evening of art and culture at the Frick Collection. This special event will feature a private tour of the museum's renowned collection of Old Master paintings, sculptures, and decorative arts. You will also enjoy a cocktail reception and a seated dinner, accompanied by live music.
    The tour will be led by a Frick curator, who will share insights into the history and significance of the collection. This will be followed by a seated dinner in the Frick Dining Room, which is decorated with original paintings and sculptures. The dinner will be accompanied by live music from a string quartet.
    This is a unique opportunity to experience the Frick Collection in a special way. Tickets are limited, so reserve yours today!",
    "Join us for an evening of art and culture at the Frick Collection. This special event will feature a private tour of the museum's renowned collection of Old Master paintings, sculptures, and decorative arts. You will also enjoy a cocktail reception and a seated dinner, accompanied by live music.
    The tour will be led by a Frick curator, who will share insights into the history and significance of the collection. You will have the opportunity to see some of the museum's most famous works, including Johannes Vermeer's Girl with a Pearl Earring, Peter Paul Ruben The Garden of Love, and Édouard Manet's Luncheon of the Boating Party.
    After the tour, you will enjoy a cocktail reception in the museum's elegant Garden Court. This will be followed by a seated dinner in the Frick Dining Room, which is decorated with original paintings and sculptures. The dinner will be accompanied by live music from a string quartet.",
  ]
end
