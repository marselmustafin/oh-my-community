module Users
  class InvitationsController < Devise::InvitationsController
    protected

    def invite_params
      devise_parameter_sanitizer.sanitize(:invite).merge(community: current_community)
    end
  end
end
