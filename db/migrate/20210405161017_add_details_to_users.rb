class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :city, :string
    add_column :users, :address_1, :string
    add_column :users, :Address_2, :string
    add_column :users, :post_code, :string
    add_column :users, :country, :string
  end
end
