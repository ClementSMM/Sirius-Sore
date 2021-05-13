class AddDeliveryPreferenceToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :delivery_preference, :string, default: 'Livraison'
  end
end
