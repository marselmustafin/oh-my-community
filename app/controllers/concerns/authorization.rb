module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    before_action :prevent_visiting_null_community_subdomain!
    before_action :prevent_user_visiting_non_community_subdomain
  end

  private

  def prevent_user_visiting_non_community_subdomain
    current_user.blank? || current_user.community_id == current_community&.id || user_not_authorized
  end

  def prevent_visiting_null_community_subdomain!
    request.subdomain.blank? || current_community || not_found
  end

  def user_not_authorized
    redirect_to(root_url(subdomain: home_subdomain))
  end

  def home_subdomain
    current_user ? current_user.community_subdomain : ""
  end
end
