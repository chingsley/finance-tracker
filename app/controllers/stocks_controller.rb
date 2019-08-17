class StocksController < ApplicationController

  def search
    if params[:stock].present?
      # @stock = Stock.new_from_lookup(params[:stock])
      # render json: @stock
      @stock = { ticker: 'stock ticker', name: 'stock name', price: 'stock price' }
      if @stock
        render 'users/my_portfolio'
      else
        flash[:danger] = "Invalid stock symbol. Please enter a correct stock symbol"
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = "Stock symbol cannot be empty string."
      redirect_to my_portfolio_path
    end
  end

end