class Stock < ApplicationRecord
  belongs_to :product

  validates :size, presence: true
  validates :quantity, presence: true
  #validates :price, presence: true

  monetize :price_cents
  
  def update_stock(amount)
    self.quantity += (amount)
    self.save
  end

end
