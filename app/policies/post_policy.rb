class PostPolicy < ApplicationPolicy
  def update?
    user.owner? || author?
  end
  alias edit? update?
  alias destroy? update?

  def rate?
    !author?
  end

  private

  def author?
    record.author == user
  end
end
