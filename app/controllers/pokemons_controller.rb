class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def create
    @pokemon = Pokemon.create(pokemon_params)
    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  private
  def pokemon_params
    params.require(:pokemons).permit(:name, :type, :description, :level)
  end
end
