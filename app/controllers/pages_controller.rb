class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home

  end

  def dashboard
    @transactions = current_user.transactions.where("start_date > ?", Date.today)
  end

  def booking_history
    @transactions = current_user.transactions.where("start_date < ?", Date.today)
  end
end
