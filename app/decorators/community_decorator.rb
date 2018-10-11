class CommunityDecorator < ApplicationDecorator
  include ActionView::Helpers::TextHelper

  delegate :id, :name, :subdomain, :description

  def thumbnail
    "no-thumbnail.jpg"
  end

  def users_count
    pluralize(object.users.count, "user")
  end
end
