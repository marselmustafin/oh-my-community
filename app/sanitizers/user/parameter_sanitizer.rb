class User
  class ParameterSanitizer < Devise::ParameterSanitizer
    USER_PARAMS = %i[
      full_name
      email
      password
      password_confirmation
      role
      avatar
    ].freeze

    COMMUNITY_PARAMS = %i[name subdomain].freeze

    def initialize(*)
      super
      permit(:sign_up, keys: USER_PARAMS + [{ community_attributes: COMMUNITY_PARAMS }])
      permit(:accept_invitation, keys: USER_PARAMS)
      permit(:account_update, keys: USER_PARAMS)
    end
  end
end
