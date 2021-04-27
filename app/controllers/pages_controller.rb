class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @gallery_banner = Gallery.find_by(category: "Bannière")

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

end
