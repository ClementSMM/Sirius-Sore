class AddPriceToStocks < ActiveRecord::Migration[6.1]
  def change
    add_monetize :stocks, :price, currency: { present: false }
  end
end
