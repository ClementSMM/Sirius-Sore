class StocksController < ApplicationController

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.save
    redirect_to root_path
  end

  def index
    @stocks = Stock.all

     if params[:query].present?
      sql_query = " \
        products.name ILIKE :query \
      "
      @stocks = Stock.joins(:product).where(sql_query, query: "%#{params[:query]}%")
    else
      @stocks = Stock.all
    end
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    @stock.update(stock_params)
    redirect_to stocks_path
  end

  private

  def stock_params
    params.require(:stock).permit(:size, :quantity, :price, :product_id)
  end
end
