module Users
  class RegistrationsController < Devise::RegistrationsController
    def new
      super do |user|
        user.build_community if current_community.blank?
      end
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
      current_community.present? ? "member" : "owner"
    end

    def sign_up_params
      devise_parameter_sanitizer.sanitize(:sign_up).merge(role: user_role, community: current_community)
    end
  end
end
