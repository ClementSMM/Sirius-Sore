class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    if params[:search].present?
      @products = Product.global_search(params[:search]["product"])
      @products = @products.where(online: true)
    else
      @products = Product.all
      @products = @products.where(online: true)

    end

    if @products.length == 0
      flash.alert = "Nous n'avons pas trouvé de produit correspondant à votre recherche"
      @products = Product.all
      @products = @products.where(online: true)

    end

  end

  def show
    @product = Product.find(params[:id])
    @stock = Stock.where(product_id: params[:id])
    @product_categories = @product.categories.map {|cat| cat.name}
    @order_item = OrderItem.new
  end

  def new
    @product = Product.new

  end

  def hidden_products
    @products = Product.where(online: false)
  end

  def create
    #raise
    @product = Product.new(product_params)
    #@product.categories << Category.find_by(name: params[:product][:categories])
    @category_array = params.dig(:product, :category_ids)
    @category_array.each do |cat|
      @category = Category.find(cat)
      @product.categories << @category
    end
    if @product.save
      if params[:product][:images].present?
        params[:product][:images].each do |image|
          @product.images.attach(image)
        end
      end
      flash.notice = "Le produit a été ajouté"
      redirect_to new_product_path
    else
      flash.notice = "Il y a eu un problème ... veuillez recommencer"
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])

  end

  def update

    @product = Product.find(params[:id])
    @product.categories.destroy_all
    @category_array = params.dig(:product, :category_ids)
    @category_array.each do |cat|
      @category = Category.find(cat)
      @product.categories << @category
    end
    #@product.images.attach(params[:product][:images])

    if @product.update(product_params)

      if params[:product][:images].present?
        params[:product][:images].each do |image|
          @product.images.attach(image)
        end
      end
      flash.notice = "Le produit a été modifié"
      redirect_to product_path(@product)
    else
      flash.notice = "Il y a eu un problème ... veuillez recommencer"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @images_cloudinary = @product.images.attachments
    @images_cloudinary.each do |image|
      image.purge
    end
    @product.destroy
    flash.alert = "Le produit a été supprimé"
    redirect_to root_path
  end

  def delete_image_attachement
    @product = Product.find(params[:id])
    # image qui appartient a la product -- on la supprime de la galerie
    @image = @product.images.attachments.where(id: params[:format])
    # image a supprimer de cloudinary
    @image.purge
    @image_cloudinary = ActiveStorage::Blob.find(params[:format])
    @image_cloudinary.purge
    redirect_to edit_product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:name, :small_description, :long_description, :category_id, :images, :online)
  end

end
