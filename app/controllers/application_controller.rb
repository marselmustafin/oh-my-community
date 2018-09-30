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

  def after_sign_in_path_for(user)
    root_url(subdomain: user.community.subdomain)
  end
end
