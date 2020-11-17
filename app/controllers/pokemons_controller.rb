class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end
  
  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params) 
    @pokemon.user = current_user
   if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
   end
  end

private
  
  def pokemon_params
    params.require(:pokemon).permit(:name, :type_pokemon, :description, :level)
  end
  
end