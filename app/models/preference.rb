class Preference < ApplicationRecord
  belongs_to :user

  validates :style, presence: true
  validates :user, presence: true

  STYLES = [
    'Expressionism',
    'Cubism',
    'Dadaism',
    'Impressionism',
    'Minimalism',
    'Pointillism',
    'Pop',
    'Surrealism',
    'Symbolism'
  ]

  def new
    @preference = Preference.new
  end

end
