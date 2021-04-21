class AddOrderItemRefToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :order_item, null: true, foreign_key: true
  end
end
