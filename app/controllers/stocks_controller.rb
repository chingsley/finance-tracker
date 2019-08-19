class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "Stock symbol cannot be empty string."
    else
      # @stock = Stock.new_from_lookup(params[:stock])
      @stock = { ticker: 'stock ticker', name: 'stock name', price: 'stock price' }
      flash.now[:danger] = "Invalid stock symbol. Please enter a correct stock symbol" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end