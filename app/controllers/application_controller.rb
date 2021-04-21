class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :record_user_activity

  STATUSES = ["En cours", "Payée" , "Prise en charge", "Prête à être retirée", "Expédiée", "Archivée - abandon", "Archivée - succès"]

  def after_sign_in_path_for(resource)
    if current_user.admin?
      dashboard_path
    else
     root_url
    end
  end

  private

  def record_user_activity
    if current_user
      current_user.update_attribute(:last_seen_at, Time.current)
    end
  end

end
