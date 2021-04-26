class OrderItemsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @order_items = OrderItem.all
  end

  def show
  end

  def new
    @order_item = OrderItem.new
  end

  def create
    @product = Product.find(params[:order_item][:product_id])
    @quantity = params[:order_item][:quantity]
    @size = params[:order_item][:size]
    @order_item = @order.add_product(@product, @quantity, @size)

    @order.order_items << @order_item
    current_user != nil ?  @order.user = current_user : @order.user = nil
    @product_stock = @product.stocks.find_by(size: params[:order_item][:size])

    if @order_item.save
      @product_stock.update_stock(- @quantity.to_i)
      @product_stock.save
      @order.save
      redirect_to @order_item.order
    else
      flash.alert = "Désolé nous sommes à court de stock pour ce produit"
      redirect_to product_path(@product)
    end
  end

  def add_one
    @order_item = OrderItem.find(params[:order_item_id])
    @product_stock = @order_item.product.stocks.find_by(size: @order_item.size)
    @order_item.quantity +=1
    #empécher de mettre dans le panier plus que le stock actuel
    if @product_stock.quantity > 0
      validation_saving_and_redirect(-1)
    else
      redirect_to order_path(@order_item.order)
      flash.notice = "Il n'y a pas assez de produits en stock"
    end

  end

  def remove_one
    @order_item = OrderItem.find(params[:order_item_id])
    @product_stock = @order_item.product.stocks.find_by(size: @order_item.size)
    @order_item.quantity -=1
    #empêcher les stocks negatifs
    if @product_stock.quantity >= 0 && @order_item.quantity > 0
      validation_saving_and_redirect(1)
    end
  end


  def edit

  end

  def update

  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @product_stock = @order_item.product.stocks.find_by(size: @order_item.size)
    @product_stock.update_stock(@order_item.quantity)
    @order_item.delete
    redirect_to order_path(@order)
  end



    private

    def order_item_params
      params.require(:product).permit(:size, :quantity)
    end

    def validation_saving_and_redirect(amount)
      # petit trick pour skip la validation - pas mega propre desolee
      if @order_item.save(validate: false)
        @product_stock.update_stock(amount)
        redirect_to order_path(@order_item.order)
      else
        redirect_to order_path(@order_item.order)
      end
    end

end
