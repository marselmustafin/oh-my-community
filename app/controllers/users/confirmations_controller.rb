module Users
  class ConfirmationsController < Devise::ConfirmationsController
    private

    def after_confirmation_path_for(_resource_name, resource)
      sign_in(resource)
      after_sign_in_path_for(resource)
    end
  end
end
