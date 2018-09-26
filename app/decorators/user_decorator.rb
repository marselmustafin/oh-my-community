class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email

  def registration_subdomain_role(subdomain)
    subdomain.blank? ? "member" : "owner"
  end

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end
end
