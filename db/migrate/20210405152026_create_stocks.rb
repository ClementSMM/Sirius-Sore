class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :size, default: "Taille unique"
      t.integer :quantity

      t.timestamps
    end
  end
end
