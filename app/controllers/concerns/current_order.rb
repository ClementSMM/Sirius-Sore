module CurrentOrder
  private
 # Cette méthode sert à chercher s'il y a déjà un panier, grâce à l'ID
  def set_order
    @order = Order.find_by(id: session[:order_id]) || Order.create
    session[:order_id] ||= @order.id
    user_signed_in? ? @order.user = current_user : @order.user = nil
  end
end