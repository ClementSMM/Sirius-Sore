# pour lancer cette tâche $ rails delete:unused_orders

namespace :delete do
  desc 'Delete the old and not used orders'

  task unused_orders: :environment do
    now = Time.current
    # lister dans un array toutes les commandes qui sont plus vielles qu'une heure
    orders = Order.where(status: "En cours")
    order_match = []

    orders.each do |order|
      if order.user.last_seen_at.before?(now - 1.hour)
        order_match << order
      end
    end

    order_match.each do |order|
      # update the stocks
      order.order_items.each do |order_item|
        # find the stock with the matching duo product / size
        @stock = Stock.find_by(product_id: order_item.product_id, size: order_item.size)
        # put the exact same quantity back in the stock
        @stock.update_stock(order_item.quantity)
      end
      # destroy each order
      order.destroy
    end
  end

end


