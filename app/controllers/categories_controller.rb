class CategoriesController < ApplicationController
 skip_before_action :authenticate_user!
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def cosmetiques
    @category_shamp = Category.find_by(name: 'Shampoings')
    @category_ap_shamp = Category.find_by(name: 'Après-shampoings')
    @category_cond = Category.find_by(name: 'Conditionners')
    @category_parf = Category.find_by(name: 'Parfums')
    @category_out = Category.find_by(name: 'Outils de toilettage')

  end

  def friandises
    @category_bois = Category.find_by(name: 'Bois de Cerf')
    @category_baton = Category.find_by(name: 'Bâton de yak')
    @category_des = Category.find_by(name: 'Friandises deshydratées')

  end

  def accessoires
    @category_col = Category.find_by(name: 'Colliers')
    @category_har = Category.find_by(name: 'Harnais')
    @category_lais = Category.find_by(name: 'Laisses')
    @category_band = Category.find_by(name: 'Bandanas')
    @category_med = Category.find_by(name: 'Medailles')
    @category_poc = Category.find_by(name: 'Pochettes')

  end

  def paniers
    @category_pan_s = Category.find_by(name: 'Paniers Sirius')
    @category_cous = Category.find_by(name: 'Coussins')
    @category_ortho = Category.find_by(name: 'Orthopédique')
    @category_can = Category.find_by(name: 'Canapés')

  end

  def vetements
    @category_pu = Category.find_by(name: 'Pulls')
    @category_man = Category.find_by(name: 'Manteaux')
    @category_t = Category.find_by(name: 'T-shirts')
    @category_au = Category.find_by(name: 'Autres')

  end

  def jeux
    @category_dou = Category.find_by(name: 'Doudous')
    @category_dent = Category.find_by(name: 'Pour les dents')

  end

  def gamelles
    @category_gam_s = Category.find_by(name: 'Gamelles Sirius')
    @category_gam = Category.find_by(name: 'Gamelles')
    @category_gam_g = Category.find_by(name: 'Gamelles anti-glouton')

  end

  def transports
    @category_sac = Category.find_by(name: 'Sacs de transport')
    @category_pous = Category.find_by(name: 'Poussettes')
    @category_sec = Category.find_by(name: 'Sécurité')

  end

end
