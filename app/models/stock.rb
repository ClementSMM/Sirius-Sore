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

  #on vérifie que personne n'a le stock dans son panier. Cela créérait trop de bugs de le supprimer alors que quelqu'un passe commande
  def deletable?
    @stock = Stock.find(id)
    @ongoing_orders = Order.where(status: "En cours")
    @ongoing_orders.each do |order|
      # on vérifie la taille de la order avant de vérifier si elle a le stock. Pour que ça aille plus vite
      if order.order_items.length !=0
        #on itère sur chaque order item pour voir si le produit, puis le stock présent est celui qu'on cherche
        order.order_items.each do |order_item|
          order_item.product.stocks.each do |stock|
            # on compare et on rend la descision finale si le stock qu'on veut supprimer est == à celui d'un order_item  
            return false if stock == @stock
          end
        end
      end
    end
  end

  # Cette méthode sert à mettre hors ligne un produit si son dernier stock vient d'être supprimé
  def is_the_last?
    if @stock.product.stocks.length == 1
      @stock.product.update(online: false)
    end
  end

end
