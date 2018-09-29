class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :posts_count

  def rating
    object.rating.round(2)
  end

  def registration_subdomain_role(subdomain)
    subdomain.blank? ? "member" : "owner"
  end

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end
end
