class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :contact, :salon ]
  helper_method :find_url #a la base pour afficher des categories au hasard sur la homepage. Finalement on les met toutes ! 

  def home
    @gallery_banner = Gallery.find_by(category: "Bannière")
    @gallery_logo = Gallery.find_by(category: "logo_grand").images.first.key
    @home_pictures = Gallery.find_by(category: "homepage")
    @products_new = find_new_products
    @discover_cat = find_discover
  end

  def dashboard

  end

  def about
    @gallery_banner = Gallery.find_by(category: "Bannière")
    @gallery_about = Gallery.find_by(category: "about")
  end

  def contact
    @gallery_banner = Gallery.find_by(category: "Bannière")

  end

  def salon
    @gallery_banner = Gallery.find_by(category: "Bannière")
    @gallery_salon = Gallery.find_by(category: 'salon')
  end


  def find_url(category)
    if category == "Cosmétiques"
      path = cosmetiques_path
    elsif category == "Friandises"
      path = friandises_path
    elsif category == "Accessoires"
      path = accessoires_path
    elsif category == "Paniers"
      path = paniers_path
    elsif category == "Vêtements"
      path = vetements_path
    elsif category == "Jeux"
      path = jeux_path
    elsif category == "Gamelles"
      path = gamelles_path
    elsif category == "Transports"
      path = transports_path
    else path = products_path
    end
    return path
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

  def find_discover
    categories = ["Cosmétiques", "Friandises", "Accessoires", "Paniers", "Vêtements", 'Jeux', "Gamelles", "Transports" ]
  end


end
