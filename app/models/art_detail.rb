class ArtDetail < ApplicationRecord
  belongs_to :artwork

  validates :artwork, presence: true
  validates :title, presence: true
  validates :description, presence: true

  TITLES = [
    "Aqua",
    "Tactility",
    "Luminosity",
    "Chroma",
    "Intricacy",
    "Focalia",
    "Enigma",
    "Impasto",
    "Silhouette",
    "Dewdrops",
    "Symmetria",
    "Velocity",
    "Radiance",
    "Abyss",
    "Chromatics",
    "Canvas",
    "Mystique",
    "Ambience",
    "Tactility",
    "Esoterica",
    "Panorama",
    "Kinetics",
    "Opulence",
    "Chiaroscuro",
    "Eclat",
    "Transparency",
    "Proximity",
    "Alchemy",
    "Mosaic",
    "Etherea",
    "Heraldry",
    "Auspice",
    "Regalia",
    "Iconic",
    "Metamorphia",
    "Divine",
    "Resonance",
    "Serendipia",
  ]

  DESCRIPTIONS = [
    "A tranquil lake reflecting the morning sun",
    "Intricate brushwork creating textured surfaces",
    "Dramatic lighting casting long shadows",
    "A vibrant color palette with bold contrasts",
    "Delicate, fine lines capturing intricate details",
    "A focal point drawing the viewer's eye",
    "Subtle use of symbolism within the composition",
    "Impasto technique adding texture and depth",
    "A mysterious figure obscured in shadows",
    "A play of light on dew-covered leaves",
    "A symmetrical composition for balance",
    "Dynamic, diagonal lines creating movement",
    "Luminous highlights on a glass surface",
    "A soft, diffused background setting a mood",
    "A rich, earthy color scheme evoking warmth",
    "A textured canvas that adds tactile interest",
    "A hidden message or narrative element",
    "A juxtaposition of warm and cool colors",
    "A focal point placed off-center for tension",
    "Expressive, gestural brushstrokes",
    "A monochromatic color scheme",
    "A central figure in a moment of contemplation",
    "A surreal element that defies reality",
    "A panoramic view of a sweeping landscape",
    "A blurred effect suggesting motion",
    "A subtle play of complementary colors",
    "A dramatic use of chiaroscuro",
    "An unexpected detail that surprises viewers",
    "A transparent layer revealing underlying layers",
    "A foreground element creating depth",
    "A muted, limited color palette",
    "A reflection in a mirror or water surface",
    "A composition divided into thirds",
    "A hidden message or symbolism in the background",
    "A mysterious figure partially obscured",
    "A controlled, precise application of paint",
    "A sense of scale and proportion",
    "A seamless transition between colors",
    "A dynamic interplay of shapes",
  ]
end
