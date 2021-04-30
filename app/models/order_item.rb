class OrderItem < ApplicationRecord
  #include ActiveModel::Validations
  belongs_to :order
  belongs_to :product

  validates_with QuantityValidator
  validates :quantity, presence: true
  attribute :quantity, :integer, default: 1
  validates :size, presence: true

  def price
    product = self.product.stocks.find_by(size: self.size)
    if product == nil
      return "Cette taille n'est plus disponible "
    else return product.price
    end
    #self.product.stocks.find_by(size: self.size).price
  end

  def total
    self.price * quantity
  end

end
