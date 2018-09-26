class ApplicationController < ActionController::Base
  include Authentication
  include Authorization
  include BulletHelper

  protect_from_forgery with: :exception

  responders :flash
  respond_to :html

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end

  protected

  def after_sign_in_path_for(_resource)
    root_url(subdomain: current_community.subdomain)
  end
end
