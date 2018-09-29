class CommentPolicy < ApplicationPolicy
  def update?
    user.owner? || commenter?
  end
  alias edit? update?
  alias destroy? update?

  private

  def commenter?
    record.commenter == user
  end
end
