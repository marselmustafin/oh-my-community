class PostPolicy < ApplicationPolicy
  def update?
    user.owner? || record.author == user
  end
  alias edit? update?
  alias destroy? update?
end
