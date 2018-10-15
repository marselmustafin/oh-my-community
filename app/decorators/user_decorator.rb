class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :posts_count, :owner?

  def avatar
    object.avatar.attached? ? object.avatar : "default-avatar.jpg"
  end

  def rating
    object.rating.round(2)
  end

  def registration_subdomain_role(subdomain)
    subdomain.blank? ? "member" : "owner"
  end
end
