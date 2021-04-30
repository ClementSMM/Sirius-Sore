class StocksController < ApplicationController

  def new
    @stock = Stock.new

  end

  def create
    @stock = Stock.new(stock_params)
    @stock.save
    redirect_to stocks_path
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

  def destroy
    @stock = Stock.find(params[:id])
    if @stock.deletable?
      if @stock.is_the_last?
        flash.alert = "Le produit a été mis hors ligne car il s'agissait de la dernière taille. Vous pouvez toujours lui ajouter une taille, puis le remettre en ligne."
      end
      @stock.delete
      flash.notice = "La taille a bien été supprimée"
      redirect_to stocks_path
    else
      flash.notice = "Il n'est pas possible de supprimer cette taille actuellement car quelqu'un l'a dans son panier"
      redirect_to stocks_path
    end

  end

  def update
    @stock = Stock.find(params[:id])
    @stock.update(stock_params)
    redirect_to stocks_path
  end

  private

  def stock_params
    params.require(:stock).permit(:size, :quantity, :price_cents, :product_id)
  end
end
