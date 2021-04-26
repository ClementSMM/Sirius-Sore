class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]


  def index
    @statuses = STATUSES
    @current_user_orders = Order.where(user: current_user)
    
    # commandes en cours de traitement par Sirius
    @ongoing_orders = find_ongoing_orders

    # anciennes commandes
    @past_orders = find_past_orders

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

  def find_ongoing_orders
    ongoing_orders = []
    @current_user_orders.each do |order|
      if ONGOING_STATUSES.include?(order.status)
        ongoing_orders << order
      end
    end
    return ongoing_orders

  end

  def find_past_orders
    past_orders = []
    @current_user_orders.each do |order|
      if PAST_STATUSES.include?(order.status)
        past_orders << order
      end
    end
    return past_orders
  end

  def order_params
    params.require(:order).permit(:status, :delivery_preference)
  end

end
