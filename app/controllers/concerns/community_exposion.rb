module CommunityExposion
  extend ActiveSupport::Concern

  included do
    expose_decorated :current_community, :fetch_community, decorator: CommunityDecorator
  end

  private

  def fetch_community
    Community.find_by(subdomain: request.subdomain)
  end
end
