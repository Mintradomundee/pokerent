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

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.update(pokemon_params) 
      redirect_to pokemon_path(@pokemon)
    else
      raise
      render :new
   end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy

    redirect_to pokemons_path
  end

private
  
  def pokemon_params
    params.require(:pokemon).permit(:name, :type_pokemon, :description, :level)
  end
  
end