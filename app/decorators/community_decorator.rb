class CommunityDecorator < ApplicationDecorator
  include ActionView::Helpers::AssetUrlHelper

  delegate :id, :name, :subdomain, :description

  def thumbnail
    "no-thumbnail.jpg"
  end
end
