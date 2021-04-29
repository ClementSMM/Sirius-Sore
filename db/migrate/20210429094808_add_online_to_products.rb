class AddOnlineToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :online, :boolean, default: true
  end
end
