class ChangeLongtitudeToLongitude < ActiveRecord::Migration[6.0]
  def change
    remove_column :pokemons, :longtitude, :float
    add_column :pokemons, :longitude, :float
  end
end
