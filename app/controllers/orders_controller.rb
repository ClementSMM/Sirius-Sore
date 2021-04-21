class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]


  def index
    @statuses = STATUSES
    @current_user_orders = Order.where(user: current_user)
    if params[:search].present?
      @orders = Order.where(status: params[:search][:status])
    else
      @orders = Order.all
    end
  end

  def show
    @statuses = STATUSES
    if Order.where(id: params[:id]).length == 0
      redirect_to root_path
      flash.alert = 'Votre panier est vide'
    else
      @order = Order.find(params[:id])
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to orders_path
  end

  def pay
    @order = Order.find(params[:id])
    @order.amount = @order.total
    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @order.user.email,
      amount: @order.amount_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: root_url,
    cancel_url: products_url
  )

  @order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(@order)
  end



  private

  def order_params
    params.require(:order).permit(:status, :delivery_preference)
  end

end
