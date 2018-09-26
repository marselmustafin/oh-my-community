module Users
  class RegistrationsController < Devise::RegistrationsController
    skip_before_action :require_community!

    def new
      super(&:build_community) if current_community.blank?
    end

    protected

    def update_resource(resource, params)
      resource.update(params)
    end

    def account_update_params
      params = devise_parameter_sanitizer.sanitize(:account_update)

      if passwords_blank?(params)
        params.except(:password, :password_confirmation)
      else
        params
      end
    end

    def passwords_blank?(params)
      params[:password].blank? && params[:password_confirmation].blank?
    end

    def user_role
      current_community.present? ? "owner" : "member"
    end

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up).merge(role: user_role, community: current_community)
    end
  end
end
