class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.find(params[:order_id])
  end

  def success
  end

  def fail
  end
end
