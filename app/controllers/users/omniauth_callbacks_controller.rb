module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    expose :user, :fetch_omniauth_user

    def google_oauth2
      if user.persisted?
        sign_in_and_redirect user
        set_flash_message!(:notice, :success, kind: "Google")
      else
        session["devise.google_data"] = request.env["omniauth.auth"].except(:extra)
        redirect_to new_user_registration_url(subdomain: omniauth_params["community_subdomain"])
      end
    end

    private

    def after_omniauth_failure_path_for(scope)
      new_session_url(scope, subdomain: omniauth_params["community_subdomain"])
    end

    def fetch_omniauth_user
      User.from_omniauth(request.env["omniauth.auth"], omniauth_params["community_id"])
    end

    def omniauth_params
      request.env["omniauth.params"]
    end
  end
end
