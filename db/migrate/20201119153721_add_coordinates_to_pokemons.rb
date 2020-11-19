class AddCoordinatesToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :latitude, :float
    add_column :pokemons, :longtitude, :float
  end
end
