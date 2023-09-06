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

  # def create
  #   @preference = Preference.new(preference_params)
  #   @preference.user = current_user
  #   @preference.save
  #   redirect_to discover_path(current_user)
  # end

  # private

  # def preference_params
  #   params.require(:preference).permit(:style)
  # end
end
