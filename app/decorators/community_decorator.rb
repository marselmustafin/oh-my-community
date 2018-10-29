class CommunityDecorator < ApplicationDecorator
  include ActionView::Helpers::TextHelper

  delegate :id, :name, :subdomain, :description

  TRUNCATION_SIZE = 150

  def thumbnail
    object.image.attached? ? object.image.variant(resize: "342x225") : "no-thumbnail.jpg"
  end

  def description
    object.description || "No description provided."
  end

  def truncated_description
    description.truncate(TRUNCATION_SIZE)
  end

  def users_count
    pluralize(object.users.count, "user")
  end
end
