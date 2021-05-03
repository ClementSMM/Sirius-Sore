class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_user_location!, if: :storable_location?

  include CurrentOrder
  before_action :set_order

  STATUSES = ["En cours", "Payée" , "Prise en charge", "Prête à être retirée", "Expédiée", "Archivée - abandon", "Archivée - succès"]
  ONGOING_STATUSES = ["Payée" , "Prise en charge", "Prête à être retirée", "Expédiée"]
  PROCESSING_STATUSES = ["Prise en charge", "Prête à être retirée", "Expédiée"]
  PAST_STATUSES = ["Archivée - abandon", "Archivée - succès"]
  $logokey = Gallery.find_by(category:"logo_petit").images.last.key

  def after_sign_in_path_for(resource)
    if current_user.admin?
      dashboard_path
    else
      stored_location_for(resource) || super
    end
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:city, :address_1, :address_2, :post_code, :country, :first_name, :last_name, :phone_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:city, :address_1, :address_2, :post_code, :country, :first_name, :last_name, :phone_number])
  end

  private
  # methode pour rediriger l'utilisateur vers la page où il était avant de se login (partie 1)
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end
  
  # methode pour rediriger l'utilisateur vers la page où il était avant de se login (partie 2)
  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end

end
