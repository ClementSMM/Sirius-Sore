class RemoveStockIdFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :stock_id, :bigint
    change_column :stocks, :quantity, :integer, :default => 1
  end
end
