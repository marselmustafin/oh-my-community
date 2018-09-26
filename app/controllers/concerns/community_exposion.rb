module CommunityExposion
  extend ActiveSupport::Concern

  included do
    expose_decorated :current_community, :set_current_community
  end

  private

  def set_current_community
    Community.find_by(subdomain: request.subdomain) || not_found
  end
end
