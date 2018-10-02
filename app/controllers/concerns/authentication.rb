module Authentication
  extend ActiveSupport::Concern

  included do
    helper do
      def current_user
        super.decorate if user_signed_in?
      end
    end
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      rails_admin_path
    elsif resource.class == User
      root_url(subdomain: resource.community.subdomain)
    end
  end

  private

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end
end
