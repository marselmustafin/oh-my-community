class CommunityDecorator < ApplicationDecorator
  include ActionView::Helpers::TextHelper

  delegate :id, :name, :subdomain, :description

  def thumbnail
    object.image.attached? ? object.image.variant(resize: "342x225") : "no-thumbnail.jpg"
  end

  def users_count
    pluralize(object.users.count, "user")
  end
end
