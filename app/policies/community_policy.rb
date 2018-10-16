class CommunityPolicy < ApplicationPolicy
  def update?
    user.owner?
  end
  alias edit? update?
  alias destroy? update?
end
