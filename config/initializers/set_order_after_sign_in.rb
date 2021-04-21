Warden::Manager.after_set_user do |user,auth,opts|
  @order = Order.find_by(id: auth.env['rack.session'][:order_id])
  if @order
    @order.user = user
    @order.save
  end
end


# Warden::Manager.after_set_user do |user,auth,opts|
#   @order = Order.find_by(id: auth.env['rack.session'][:order_id]) || Order.create
#   auth.session[:order_id] ||= @order.id
#   @order.user = user
#   @order.save
# end