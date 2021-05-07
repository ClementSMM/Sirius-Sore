class OrdersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]


  def index
    @statuses = STATUSES
    @current_user_orders = Order.where(user: current_user)
    
    # commandes en cours de traitement par Sirius
    @ongoing_orders = find_ongoing_orders
    @paid_orders = Order.where(status: "Payée")
    @processing_orders = find_processing_orders

    # anciennes commandes
    @past_orders = find_past_orders
    @past_orders_admin = find_past_orders_admin

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
      flash.alert = 'Oups, il y a eu une erreur'
    else
      @order = Order.find(params[:id])
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if current_user.admin?
      redirect_to orders_path
    else
      redirect_to order_path(@order)
      flash.alert = 'Le mode de livraison a bien été pris en compte'
    end
  end

  def pay
    @order = Order.find(params[:id])
    @order.update(order_params)
    @order.update(updated_at: Time.current)
    # on applique les frais de livraison
    if @order.delivery_preference == 'Livraison'
      @order.amount = @order.total + Money.new(1000, 'EUR')
    else
      @order.amount = @order.total
    end 
    session = Stripe::Checkout::Session.create(
    payment_method_types: ['card'],
    line_items: [{
      name: @order.user.email,
      amount: @order.amount_cents,
      currency: 'eur',
      quantity: 1
    }],
    success_url: success_url,
    cancel_url: fail_url
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
  def find_past_orders_admin
    past_orders = []
    Order.all.each do |order|
      if PAST_STATUSES.include?(order.status)
        past_orders << order
      end
    end
    return past_orders
  end

  def find_processing_orders
    process_orders = []
    Order.all.each do |order|
      if PROCESSING_STATUSES.include?(order.status)
        process_orders << order
      end
    end
    return process_orders
  end

  def order_params
    params.require(:order).permit(:status, :delivery_preference)
  end

end
