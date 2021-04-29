class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :contact, :salon ]

  def home
    @gallery_banner = Gallery.find_by(category: "Bannière")
    @gallery_accueil = Gallery.find_by(category: "Image accueil")
    @products_new = find_new_products


  end

  def dashboard

  end

  def about
    @gallery_banner = Gallery.find_by(category: "Bannière")

  end

  def contact
    @gallery_banner = Gallery.find_by(category: "Bannière")

  end

  def salon 
    @gallery_banner = Gallery.find_by(category: "Bannière")

  end


  private 

  def find_new_products
  @new_products = []

  @category_new = Category.find_by(name: 'Nouveautés')
  @category_new.products.each do |product| 
    next if product.online == false
    @new_products << product
  end
  return @new_products
  end

end
