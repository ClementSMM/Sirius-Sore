class QuantityValidator < ActiveModel::Validator
  def validate(record)
    @stock_product = Product.find(record.product_id).stocks.find_by(size: record.size).quantity
    if record.quantity > @stock_product
      record.errors.add( :quantity, "Il ne reste plus que #{@stock_product} produits de ce type en stock")
    end

  end
end
