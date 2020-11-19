class PokemonsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
      if params[:query].present?
        @pokemons = Pokemon.where("name ILIKE ?", "%#{params[:query]}%")
      else
        @pokemons = policy_scope(Pokemon).order(created_at: :desc)
      end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    @transaction = Transaction.new
    authorize @pokemon
  end

  def new
    @pokemon = Pokemon.new
    authorize @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user = current_user
    authorize @pokemon
   if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
   end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
    if @pokemon.update(pokemon_params)
      redirect_to pokemon_path(@pokemon)
    else
      raise
      render :new
   end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    authorize @pokemon
    @pokemon.destroy

    redirect_to pokemons_path
  end

private

  def pokemon_params
    params.require(:pokemon).permit(:name, :type_pokemon, :description, :level, :photo)
  end

end
