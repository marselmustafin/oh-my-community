class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper
  include CommunityExposion

  protect_from_forgery with: :exception, prepend: true

  responders :flash
  respond_to :html

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      rails_admin_path
    elsif resource.class == User
      root_url(subdomain: resource.community.subdomain)
    end
  end
end
