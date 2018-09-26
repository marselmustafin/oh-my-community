module CommunityExposion
  extend ActiveSupport::Concern

  included do
    expose_decorated :current_community, :fetch_community, decorator: CommunityDecorator
    before_action :prevent_null_community_subdomain!
  end

  private

  def prevent_null_community_subdomain!
    request.subdomain.blank? || current_community || not_found
  end

  def fetch_community
    Community.find_by(subdomain: request.subdomain)
  end
end
