module CurrentOrder
  private
 # Cette méthode sert à chercher s'il y a déjà un panier, grâce à l'ID
 # on doit ajouter une condition pour que le panier soit uniquement "en cours".
 # (il y avait un beug : après un achat payé, le panier reste ici, et on pouvait y ajouter plein d'articles) 
  def set_order
    @order = Order.find_by(id: session[:order_id]) || Order.create
    if @order.status != "En cours"
      session[:order_id] = Order.create.id
    end
    session[:order_id] ||= @order.id
    user_signed_in? ? @order.user = current_user : @order.user = nil
  end
end