class RenamePokemonTypeToTypePokemon < ActiveRecord::Migration[6.0]
  def change
    rename_column :pokemons, :type, :type_pokemon
  end
end
