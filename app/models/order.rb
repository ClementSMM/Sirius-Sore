class Order < ApplicationRecord
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy

  validates :status, presence: true
  monetize :amount_cents

  def add_product(product, quantity, size)
    OrderItem.new(product: product, quantity: quantity, size: size)
  end

  def total
    order_items.to_a.sum(&:total)
  end


end
