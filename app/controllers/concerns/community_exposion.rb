module CommunityExposion
  extend ActiveSupport::Concern

  included do
    expose_decorated :current_community, :fetch_community, decorator: CommunityDecorator
    before_action :require_community!
  end

  private

  def require_community!
    current_community || not_found
  end

  def fetch_community
    Community.find_by(subdomain: request.subdomain)
  end
end
