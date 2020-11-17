class Pokemon < ApplicationRecord
  TYPE_POKEMON = ["Grass", "Fairy", "Fire", "Dragon", "Bug", "Ice", "Fighting", "Poison", "Flying", "Rock", "Normal", "water", "Ghost"]

  belongs_to :user
  validates :name, :description, presence: true
  validates :level, presence: true, numericality: { only_integer: true }, inclusion: { in: (1..3) }
  validates :type_pokemon, presence: true, inclusion: { in: TYPE_POKEMON }
end
