class Pokemon < ApplicationRecord
  TYPE_POKEMON = ["Grass", "Fairy", "Fire", "Dragon", "Bug", "Ice", "Fighting", "Poison", "Flying", "Rock", "Normal", "Water", "Ghost", "Electric", "Psychic", "Steel"]

  belongs_to :user

  validates :name, :description, presence: true
  validates :level, presence: true, numericality: { only_integer: true }, inclusion: { in: (1..3) }
  validates :type_pokemon, presence: true, inclusion: { in: TYPE_POKEMON }
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
