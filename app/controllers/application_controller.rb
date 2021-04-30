class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :record_user_activity
  before_action :configure_permitted_parameters, if: :devise_controller?
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
     root_url
    end
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:city, :address_1, :address_2, :post_code, :country, :first_name, :last_name, :phone_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:city, :address_1, :address_2, :post_code, :country, :first_name, :last_name, :phone_number])
  end

  private

  def record_user_activity
    if current_user
      current_user.update_attribute(:last_seen_at, Time.current)
    end
  end

end
