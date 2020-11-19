class TransactionsController < ApplicationController

  def index
    @transaction = Transaction.where(user_id: current_user.id)
  end

  def show
    set_transaction
    @pokemon = @transaction.pokemon
  end

  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @transaction = Transaction.new(transaction_params)
    @transaction.pokemon = @pokemon
    @transaction.user = current_user
    authorize @transaction
    # @start_date = Date.parse(transaction_params[:start_date])
    start_date = @transaction.start_date.to_date
    # @end_date = Date.parse(transaction_params[:end_date])
    end_date = @transaction.end_date.to_date
    days = end_date - start_date

    @transaction.save

    flash[:notice] = "Booked Successfully!"
    render "pokemons/show"
  end

  def destroy
    set_transaction
    @transaction.destroy
    redirect_to pokemon_path(@transaction.pokemon)
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:pokemon_id, :start_date, :end_date)
  end
end
