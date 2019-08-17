class Stock < ApplicationRecord

  def self.new_from_lookup(ticker_symbol)
    begin
      # StockQuote::Stock.new(api_key: 'Tpk_2beaf38fa2f24a30a25addad2927e565')
      # client = IEX::Api::Client.new(
      #   publishable_token: 'pk_de4f14bd5e9b48deada533b0e7061cdd',
      #   endpoint: 'https://cloud.iexpais.com'
      # )
      # looked_up_stock = client.quote(ticker_symbol)
      # new(name: looked_up_stock.name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.l)
      looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
      price = strip_commas(looked_up_stock.l)
      new(name: looked_up_stock.name, ticker: looked_up_stock.symbol, last_price: price)
    rescue Exception => e
      return nil
    end
  end

  def self.strip_commas(number)
    number.gsub(",", "")
  end
end
